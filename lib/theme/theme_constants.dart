import 'package:flutter/material.dart';

class AppTheme {
 

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: Colors.purple,
      iconTheme: const IconThemeData(color: Colors.purple),
      listTileTheme: const ListTileThemeData(iconColor: Colors.purple),
      fontFamily: 'Roboto',
      textTheme: TextTheme(
          displayLarge: TextStyle(
        color: Colors.grey.shade900,
      )),
      appBarTheme: const AppBarTheme(
        color: Colors.purple,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ));

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purple,
      listTileTheme: ListTileThemeData(iconColor: Colors.white),
      useMaterial3: true,
      iconTheme: IconThemeData(color: Colors.white),
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ));
}
