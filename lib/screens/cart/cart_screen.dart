import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/controllers/cart_view_model.dart';
import 'package:suit_up/db/db_provider.dart';
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
  double subTotal = 0.0;

  DatabaseProvider databaseProvider = DatabaseProvider.db;

  @override
  void initState() {
    databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart Screen"),
        ),
        body: LayoutBuilder(
          builder: (p0, p1) {
            return FutureBuilder<List<CartProduct>>(
              future: databaseProvider.cartItems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: TextCustom(text: 'Ups! Something went wrong.'),
                  );
                }
                if (snapshot.hasData && snapshot.data != null) {
                  List<CartProduct> cartProducts = snapshot.data ?? [];
                  return ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 0.3,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                ),
                                height: Dimensions.height70,
                                width: Dimensions.height70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius16,
                                  ),
                                  child: Image.asset(
                                    cartProducts[index].imageUrl,
                                    errorBuilder:
                                        ((context, error, stackTrace) {
                                      return const Icon(Icons.error_outline);
                                    }),
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width16),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartProducts[index].name,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Rs. ${cartProducts[index].price}",
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: Dimensions.font11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Dimensions.width5,
                                        ),
                                        Text(
                                          "x${cartProducts[index].quantity}    ( ${cartProducts[index].price * cartProducts[index].quantity} )",
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: Dimensions.font12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: Dimensions.width16),
                                            InkWell(
                                              onTap: (() {
                                                if ((cartProducts[index])
                                                        .quantity >
                                                    1) {
                                                  databaseProvider
                                                      .removeFromCart(index);
                                                }
                                              }),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 0.3,
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions.radius8,
                                                    )),
                                                height: Dimensions.height30,
                                                width: Dimensions.width30,
                                                child: Icon(
                                                  Icons.remove,
                                                  size: Dimensions.iconSize18,
                                                  color: Colors.blue.shade400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: Dimensions.width16),
                                            Text(
                                              "${cartProducts[index].quantity}",
                                              style: TextStyle(
                                                fontSize: Dimensions.font15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: Dimensions.width16),
                                            InkWell(
                                              onTap: (() {
                                                databaseProvider.addToCart(
                                                    cartProducts[index]);
                                              }),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 0.3,
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      Dimensions.radius8,
                                                    )),
                                                height: Dimensions.height30,
                                                width: Dimensions.width30,
                                                child: Icon(
                                                  Icons.add,
                                                  size: Dimensions.iconSize18,
                                                  color: Colors.blue.shade400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: (() {
                                            databaseProvider
                                                .removeFromCart(index);
                                          }),
                                          icon: Icon(
                                            CupertinoIcons.trash,
                                            size: Dimensions.iconSize18,
                                            color: Colors.red.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 3,
                        color: Colors.white,
                      );
                    },
                  );
                }
                return Center(
                  child: TextCustom(text: 'Your Cart is Empty!'),
                );
              },
            );
          },
        ));
  }
}
