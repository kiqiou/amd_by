import 'dart:developer';
import 'dart:io';

import 'package:amdby_shop/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FavouritesScreen extends StatelessWidget {
  final searchController = TextEditingController();

  FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            MyTextField(
                controller: searchController,
                hintText: 'Поиск',
                obscureText: false,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(CupertinoIcons.search),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  } else if (val.length > 30) {
                    return 'Name too long';
                  }
                  return null;
                }),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: fetchData,
              child: Container(
                height: 70,
                width: 70,
                color: Colors.grey,
                child: Center(child: Text('Ещкере')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));
    if (response.statusCode == 200) {
      log('Ответ сервера: ${response.body}');
    } else {
      log('Ошибка: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    log('Ошибка подключения: $e');
  } on HttpException catch (e) {
    log('HTTP-ошибка: $e');
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}

Future<void> sendData(String name, String email) async {
  final url = Uri.parse('https://fast-shirts-move.loca.lt');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'name': name, 'email': email});

  try {
    print('URL: $url');
    print('Headers: $headers');
    print('Body: $body');

    final response = await http
        .post(
      url,
      headers: headers,
      body: body,
    )
        .timeout(Duration(seconds: 60), onTimeout: () {
      throw Exception('Request timed out');
    });

    print('Response: ${response.statusCode}, ${response.body}');

    if (response.statusCode == 201) {
      print('Data sent successfully');
      User newUser = User.fromJson(jsonDecode(response.body));
      print('New user: ${newUser.name}, ${newUser.email}');
    } else {
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Data to Backend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () async {
                await sendData(_nameController.text, _emailController.text);
              },
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
