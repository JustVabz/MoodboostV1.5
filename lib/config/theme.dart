import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0xFFF7EED3);
const Color secondary = Color(0xFFAAB396);
const Color priTextColor = Color(0xFFAAB396);
const Color secTextColor = Color(0xFFEBDAA8);


  

  final ThemeData appTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: secondary,
        secondary: secondary,
        onSecondary: primary,
        error: Colors.redAccent,
        onError: primary,
        surface: primary,
        onSurface: secondary),
    scaffoldBackgroundColor: primary,
    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
          color: priTextColor, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: secondary),
    ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: primary,
    selectedItemColor: secondary,
    unselectedItemColor: Colors.white,
  ),
);


