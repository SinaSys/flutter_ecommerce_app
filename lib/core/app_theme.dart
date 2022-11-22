import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          backgroundColor: const Color(0xFFf16b26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.deepOrange)),
      iconTheme: const IconThemeData(color: Color(0xFFA6A3A0)),
      textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w500, color: Colors.black),
          headline3: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          headline4: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          headline5: TextStyle(fontSize: 15, color: Colors.grey),
          headline6: TextStyle(fontSize: 12)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true));
}
