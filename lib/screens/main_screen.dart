import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/screens/account/account_screen.dart';
import 'package:suit_up/screens/cart/cart_screen.dart';
import 'package:suit_up/screens/home/home_screen.dart';

import '../db/cart_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final screens = [
    const HomeScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    context.read<CartProvider>().getCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(
                    CupertinoIcons.shopping_cart,
                  ),
                ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(
                Icons.person,
              ),
            ),
          ]),
    );
  }
}
