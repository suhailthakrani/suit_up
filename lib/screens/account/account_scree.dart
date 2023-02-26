import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkTheme = false;
  ThemeMode _themeMode = ThemeMode.light;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
    Future<void> setThemeMode(ThemeMode themeMode) async {
    final sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.setInt('themeMode', themeMode.index);


    setState(() {
      _themeMode = themeMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch(
            value: isDarkTheme,
            onChanged: (value) {
              setState(() {
                isDarkTheme = value;
              });
            }),
      ),
    );
  }
}
