import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
            isDarkTheme ? Colors.grey.shade600 : Colors.white,
        primaryColor: Colors.purple,
        colorScheme: ThemeData().colorScheme.copyWith(
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
              secondary: Colors.purpleAccent,
            ),
        cardColor: isDarkTheme ? Colors.grey.shade500 : Colors.grey.shade100,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              colorScheme:
                  isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
            ));
  }
}
