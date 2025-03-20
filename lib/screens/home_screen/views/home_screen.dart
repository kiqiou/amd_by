import 'dart:developer';
import 'dart:io';

import 'package:amdby_shop/components/my_text_field.dart';
import 'package:amdby_shop/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:amdby_shop/screens/home_screen/views/details_screen.dart';
import 'package:amdby_shop/screens/home_screen/widgets/promo_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'amd',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: Color.fromRGBO(127, 124, 122, 1),
                      fontSize: 25,
                    ),
                  ),
                  TextSpan(
                    text: 'by',
                    style: TextStyle(
                      color: Color.fromRGBO(111, 191, 55, 1),
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: Icon(CupertinoIcons.arrow_right_to_line)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
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
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: fetchData,
              child: Container(
                height: 30,
                width: 30,
                color: Colors.red,
                child: Text('Ещкере'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: PromoBanner(
                banners: [
                  'assets/images/banners/banner-1.png',
                  'assets/images/banners/banner-2.png',
                  'assets/images/banners/banner-3.png'
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: 8,
                itemBuilder: (context, int i) {
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const DetailsScreen(),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/first_thing.png',
                              fit: BoxFit.cover,
                              height: 165,
                              width: 180,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                  ),
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            '(10)',
                                            style: TextStyle(
                                                color: Colors.grey, fontWeight: FontWeight.w800, fontSize: 10),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                                    child: Text(
                                      '1072.00 руб.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                'Робот вылесос Xiaomi Robot Vacuum S20+ B108GL',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_border_sharp),
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_circle_outline),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
