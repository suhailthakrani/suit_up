// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:suit_up/theme/theme_constants.dart';
import 'package:suit_up/theme/theme_manager.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/custom_text.dart';

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
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(Dimensions.width12),
            children: [
              SizedBox(
                height: Dimensions.width150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      child: CircleAvatar(
                        radius: Dimensions.height60,
                        backgroundColor: Colors.amber,
                        foregroundImage: const AssetImage(
                          'assets/images/apple.png',
                        ),
                      ),
                    ),
                    TextCustom(
                      text: 'Suhail Thakrani',
                      fontSize: Dimensions.font16,
                      fontWeight: FontWeight.w600,
                    ),
                    TextCustom(
                      text: 'suhailthakrani12@gmail.com',
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  icon: Icon(
                    themeNotifier.isDark
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                  ),
                  onPressed: () {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  },
                  label: Text(
                    themeNotifier.isDark ? 'Dark Mode' : 'Light Mode',
                  ),
                ),
              ),
              CustomTile(
                isDark: isDark,
                title: 'Edit Your Profile',
                leading: Icon(
                  Icons.edit,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.width16,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
              CustomTile(
                isDark: isDark,
                title: 'Favorite',
                leading: Icon(
                  CupertinoIcons.heart,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.width16,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
              CustomTile(
                isDark: isDark,
                title: 'Downloads',
                leading: Icon(
                  Icons.download,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.width16,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
              CustomTile(
                leading: Icon(
                  Icons.language,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                isDark: isDark,
                title: 'Language',
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.width16,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
              CustomTile(
                leading: Icon(
                  themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                title: 'Dark Mode',
                isDark: isDark,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.width16,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
              CustomTile(
                leading: Icon(
                  Icons.wifi,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                title: 'Only Download via WiFi',
                isDark: isDark,
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.width16,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
              CustomTile(
                title: 'Play in Ground',
                isDark: isDark,
                leading: Icon(
                  CupertinoIcons.play_rectangle,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: Dimensions.width16,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class CustomTile extends StatelessWidget {
  final Widget trailing;
  final String title;
  final bool isDark;

  final Widget leading;
  const CustomTile({
    Key? key,
    required this.trailing,
    required this.title,
    required this.isDark,
    required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: leading,
        title: TextCustom(
          text: title,
        ),
        trailing: trailing);
  }
}
