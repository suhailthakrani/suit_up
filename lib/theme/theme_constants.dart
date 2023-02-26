import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: Colors.purple,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple,
    useMaterial3: true,
    fontFamily: 'Roboto',
  );
}
