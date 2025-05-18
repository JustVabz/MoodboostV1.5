import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color accentColor =  Color(0xFF4E45E4);
final Color primary =  Color(0xFFF7EED3);
final Color secondary =  Color(0xFFA3AD93);
final Color priTextColor =  Color(0xFFAAB396);
final Color sectextColor =  Color(0xFFEBDAA8);

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
          color: secondary, fontSize: 20, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: secondary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: accentColor,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ));
