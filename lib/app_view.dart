import 'package:amdby_shop/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget{
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'amdby',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Colors.orangeAccent,
          onPrimary: Colors.white
        ),
        hintColor: Colors.black12,
        primaryColor: Colors.black26,
        textTheme: TextTheme(
          labelSmall: TextStyle(color: Colors.black45, fontSize: 14.0),
          labelMedium: TextStyle(color: Colors.black45, fontSize: 17.0),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'amd.by'),
    );
  }
}
