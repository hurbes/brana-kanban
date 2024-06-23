import 'package:flutter/material.dart';

final BRANA_APP_LIGHT_THEME = ThemeData(
  scaffoldBackgroundColor: const Color(0xffF6F7F9),
  primaryColor: const Color(0xff24A19C),
  canvasColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey[700]),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xff24A19C),
    unselectedItemColor: Colors.grey,
  ),
);

final BRANA_APP_DARK_THEME = ThemeData(
  scaffoldBackgroundColor: const Color(0xffF6F7F9),
  primaryColor: const Color(0xff24A19C),
  canvasColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.grey[700]),
    titleTextStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xff24A19C),
    unselectedItemColor: Colors.grey,
  ),
);
