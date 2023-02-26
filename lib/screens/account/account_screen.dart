import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/theme/theme_constants.dart';
import 'package:suit_up/theme/theme_manager.dart';

ThemeManager themeManager = ThemeManager();

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDark = false;
  final myTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
    fontFamily: 'Open Sans',
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (BuildContext context, themeNotifier, child) {
      return Scaffold(
        body: Center(
          child: ElevatedButton.icon(
            icon: Icon(themeNotifier.isDark ? Icons.nightlight_round:Icons.wb_sunny,),
            onPressed: () {
              themeNotifier.isDark ? themeNotifier.isDark = false: themeNotifier.isDark = true;
            },
            label: Text(
              themeNotifier.isDark?
              'Dark Mode': 'Light Mode',
            ),
          ),
        ),
      );
    });
  }
}
