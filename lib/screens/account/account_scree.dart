import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/models/theme_model.dart';
import 'package:suit_up/theme/theme_manager.dart';

ThemeManager themeManager = ThemeManager();

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<ThemeType>(
            value: context.watch<ThemeModel>().themeType,
            items: ThemeType.values
                .map((ThemeType themeType) => DropdownMenuItem<ThemeType>(
                    value: themeType, child: Text(themeType.toString())))
                .toList(),
            onChanged: (ThemeType? value) {
              context.read<ThemeModel>().setThemeType(value!);
            },
          )
        ],
      ),
    ));
  }
}
