import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/models/theme_model.dart';
import 'package:suit_up/theme/theme_constants.dart';
import 'package:suit_up/theme/theme_manager.dart';
import 'package:suit_up/screens/main_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeModel>(
    create: (_) => ThemeModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeModel>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: themeModel.themeType == ThemeType.Dark ? AppTheme.darkTheme: AppTheme.lightTheme,
      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}
