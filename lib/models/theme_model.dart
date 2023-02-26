import 'package:flutter/material.dart';

enum ThemeType {
  Dark,
  Light,
}
class ThemeModel extends ChangeNotifier{
  ThemeType _themeType = ThemeType.Light;
  ///
  ThemeType get themeType => _themeType;


  ///
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }
}