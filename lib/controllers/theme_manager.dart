import 'package:flutter/material.dart';
import 'package:suit_up/constants/theme_constants.dart';

class ThemeManager with ChangeNotifier{
  ThemeData _themeData = AppTheme.lightTheme;
  ThemeData get themeData => _themeData;

  void setTheme(ThemeData themeData) async{
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme() async {
    _themeData = _themeData == AppTheme.darkTheme ? AppTheme.darkTheme: AppTheme.lightTheme;
    notifyListeners();
  }
}