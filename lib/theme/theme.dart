import 'package:amdby_shop/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class ThemeD{
  ThemeData themedata = ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.teal,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.teal,
        ),
      ),
      scaffoldBackgroundColor: Colors.grey[200],
      textTheme: TextTheme(
        bodyLarge: TextStyle(),
        bodyMedium: TextStyle(),
      ).apply(
        bodyColor: Colors.teal[800],
      ));
}