import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Colors.purple,
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            secondary: Colors.purpleAccent,
          ),
      textTheme: const TextTheme().copyWith(
        titleLarge: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      fontFamily: 'Roboto',
      cardTheme: ThemeData().cardTheme.copyWith(color: Colors.grey.shade300),
      cardColor: isDarkTheme ? Colors.grey.shade500 : Colors.grey.shade100,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
    );
  }
}

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
  );

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
    )),
  );
}
