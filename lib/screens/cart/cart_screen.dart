import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/controllers/cart_view_model.dart';
import 'package:suit_up/models/cart_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/custom_text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, cartViewModel, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Your Cart Screen"),
            ),
            body: LayoutBuilder(
              builder: (p0, p1) {
                return ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: cartViewModel.cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: Dimensions.height50,
                            child: Image.asset(
                                cartViewModel.cartItems[index].imageUrl),
                          ),
                          WidthCustom(10),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text: cartViewModel.cartItems[index].name,
                              ),
                              TextCustom(
                                text:
                                    "Rs. ${cartViewModel.cartItems[index].price}",
                              ),
                            ],
                          )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 3,
                      color: Colors.white,
                    );
                  },
                );
              },
            ));
      },
    );
  }
}
