import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:suit_up/controllers/asset_manager.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/theme/theme_constants.dart';
import 'package:suit_up/theme/theme_manager.dart';
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
      // backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: CupertinoTextField(
                      placeholder: 'Type here',
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(
                          CupertinoIcons.search,
                          color: Colors.purple,
                        ),
                      ),
                      controller: _searchController,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                //Good Morning!
                WidthCustom(10),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.grey.shade300,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.notifications,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            HeightCustom(10),
            SizedBox(
              height: 130,
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AssetManager.cardImage,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            HeightCustom(16),
            Container(
              height: 50,
              child: ListView.separated(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Category'));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return WidthCustom(5);
                },
              ),
            ),
            HeightCustom(16),
            Container(
              height: 500,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AssetManager.card1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AssetManager.card2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AssetManager.card3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AssetManager.card4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AssetManager.card1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AssetManager.card2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
