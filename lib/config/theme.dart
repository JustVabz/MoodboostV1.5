import 'package:flutter/material.dart';

const Color primary = Color(0xFFF7EED3);
const Color secondary = Color(0xFFAAB396);
const Color priTextColor = Color(0xFFAAB396);
const Color secTextColor = Color(0xFFEBDAA8);

class AppTheme {
  

  static final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: primary,
  primaryColor: secondary,
  fontFamily: 'etna-free-font.otf',
  textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 60.0),
        displaySmall: TextStyle(fontSize: 48.0),
        headlineMedium: TextStyle(fontSize: 34.0),
        headlineSmall: TextStyle(fontSize: 24.0),
        titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(fontSize: 16.0),
        titleSmall: TextStyle(fontSize: 14.0),
        bodyLarge: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 14.0),
        bodySmall: TextStyle(fontSize: 12.0),
        labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 10.0, letterSpacing: 0.5),
      ).apply(
        fontFamily: 'etna-free-font.otf',
      ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: primary,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: primary, backgroundColor: secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: primary,
    selectedItemColor: secondary,
    unselectedItemColor: secTextColor,
  ),
);

}
