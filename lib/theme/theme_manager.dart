import 'package:flutter/material.dart';
import 'package:suit_up/theme/theme_constants.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  // void setTheme(ThemeData themeData) async {
  //   _themeData = themeData;
  //   notifyListeners();
  // }

  void toggleTheme(bool isDarkTheme) async {
    _themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
