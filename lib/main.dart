import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suit_up/controllers/theme_manager.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/screens/home/home_screen.dart';
import 'package:suit_up/screens/main_screen.dart';

import 'screens/authentication/sign_in_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

final ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  @override
  void initState() {
    _getThemeMode();
    super.initState();
  }

  void _getThemeMode() async {
    final sharePref = await SharedPreferences.getInstance();
    final themeMode = sharePref.getInt('themeMode');
    if (themeMode == null) {
      return;
    }
    setState(() {
      _themeMode = ThemeMode.values[themeMode];
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      
      home: const MainScreen(),
    );
  }
}
