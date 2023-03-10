import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/db/cart_provider.dart';
import 'package:suit_up/screens/home/components/product_details_screen.dart';
import 'package:suit_up/screens/home/home_screen.dart';
import 'package:suit_up/screens/main_screen.dart';
import 'package:suit_up/theme/theme_constants.dart';
import 'package:suit_up/theme/theme_manager.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeManager()),
          ChangeNotifierProvider(create: (_)=> CartProvider())
          
        ],
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





