import 'package:shared_preferences/shared_preferences.dart';

class MyThemePreferences {
  static const THEMEKEY = 'themekey';
  //
  setTheme(bool value) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.setBool(THEMEKEY, value);
  }

  ///
  getTheme() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs.getBool(THEMEKEY);
  }
}
