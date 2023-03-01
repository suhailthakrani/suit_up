import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/screens/home/components/product_screen.dart';
import 'package:suit_up/screens/home/home_screen.dart';
import 'package:suit_up/screens/main_screen.dart';
import 'package:suit_up/theme/theme_constants.dart';
import 'package:suit_up/theme/theme_manager.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final myTheme = ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeManager(),
        child:
            Consumer<ThemeManager>(builder: ((context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                themeNotifier.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            home: const MainScreen(),
          );
        })));
  }
}
