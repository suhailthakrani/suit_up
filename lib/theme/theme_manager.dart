import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suit_up/theme/shared_prefs.dart';
import 'package:suit_up/theme/theme_constants.dart';

class ThemeManager with ChangeNotifier {
  late bool _isDark;
  late MyThemePreferences _mySharedPreferences;

  ///
  bool get isDark => _isDark;

  ThemeManager() {
    _isDark = false;
    _mySharedPreferences = MyThemePreferences();
    getSharedPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _mySharedPreferences.setTheme(value);
    notifyListeners();
  }

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

  getSharedPreferences() async {
    _isDark = await _mySharedPreferences.getTheme() ?? false;
    notifyListeners();
  }
}
