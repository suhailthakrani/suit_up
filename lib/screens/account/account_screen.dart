// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';

import 'package:suit_up/theme/theme_constants.dart';
import 'package:suit_up/theme/theme_manager.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/custom_text.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDark = false;

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
                height: Dimensions.width180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: Dimensions.height60,
                      backgroundColor: Colors.grey.shade300,
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage(
                            'assets/images/apple.png',
                          ),
                        ),
                      ),
                    ),
                    HeightCustom(3),
                    TextCustom(
                      text: 'Suhail Thakrani',
                      fontSize: Dimensions.font16,
                      fontWeight: FontWeight.w600,
                    ),
                    HeightCustom(2),
                    TextCustom(
                      text: 'suhailthakrani12@gmail.com',
                      fontSize: Dimensions.font12,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              HeightCustom(Dimensions.height16),
              CustomTile(
                isDark: isDark,
                title: 'Edit Your Profile',
                leading: Icon(
                  Icons.edit,
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
              ),
              HeightCustom(Dimensions.height8),
              CustomTile(
                isDark: isDark,
                title: 'Reorder',
                leading: Icon(
                  Icons.shopify_outlined,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
              ),
              HeightCustom(Dimensions.height8),
              CustomTile(
                leading: Icon(
                  Icons.language,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                isDark: isDark,
                title: 'Language',
              ),
              HeightCustom(Dimensions.height8),
              CustomTile(
                leading: Icon(
                  themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                  color: isDark
                      ? AppTheme.darkTheme.listTileTheme.iconColor
                      : AppTheme.lightTheme.listTileTheme.iconColor,
                ),
                title: themeNotifier.isDark ? 'Dark Mode' : 'Light Mode',
                isDark: themeNotifier.isDark,
                trailing: Switch(
                    value: themeNotifier.isDark,
                    onChanged: (value) {
                      setState(() {
                        themeNotifier.isDark = value;
                      });
                    }),
              ),
              CustomTile(
                title: 'Log Out',
                isDark: isDark,
                leading: Icon(Icons.logout_outlined),
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
    this.trailing = const Icon(
      Icons.arrow_forward_ios,
      size: 16,
    ),
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
