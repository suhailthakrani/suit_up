import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:suit_up/controllers/theme_manager.dart';
import 'package:suit_up/widgets/custom_textfeild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
   final ThemeManager _themeManager = ThemeManager();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            CupertinoTextField(
              placeholder: 'Type here',
              controller: _searchController,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
            )
          ],
        ),

      ),
     
    );
  }
}
