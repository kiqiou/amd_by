import 'package:amdby_shop/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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