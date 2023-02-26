import 'package:flutter/material.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeManager.themeData,
      themeMode: ThemeMode.light,
      home: const MainScreen(),
    );
  }
}
