// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:suit_up/db/db_helper.dart';
import 'package:suit_up/db/cart_provider.dart';
import 'package:suit_up/models/cart_model.dart';
import 'package:suit_up/utils/dimensions.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double subTotal = 0.0;

  // CartProvider cartProvider = CartProvider();
  DatabaseHelper? databaseHelper;

  @override
  void initState() {
    databaseHelper = DatabaseHelper.db;
    // cartProvider = Provider.of<CartProvider>(context, listen: false);
    context.read<CartProvider>().getData();
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
          return Consumer<CartProvider>(
            builder: (context, provider, child) {
              if (provider.cart.isEmpty) {
                return const Center(
                    child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ));
              } else {
                return ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  itemCount: provider.cart.length,
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
                          child: Row(children: [
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
                                  provider.cart[index].imageUrl,
                                  errorBuilder: ((context, error, stackTrace) {
                                    return const Icon(Icons.error_outline);
                                  }),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width16),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.cart[index].name,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height16),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        provider.cart[index].quantity!,
                                    builder: (context, value, child) {
                                      return PlusMinusButtons(
                                          addQuantity: () {
                                            provider.addQuantity(
                                                provider.cart[index].id!);
                                            databaseHelper!
                                                .updateQuantity(CartProduct(
                                                    id: index,
                                                    name: provider
                                                        .cart[index].name,
                                                    imageUrl: provider
                                                        .cart[index].imageUrl,
                                                    price: provider
                                                        .cart[index].price,
                                                    category: provider
                                                        .cart[index].category,
                                                    size: provider
                                                        .cart[index].size,
                                                    color: provider
                                                        .cart[index].color,
                                                    quantity: provider
                                                        .cart[index].quantity))
                                                .then((value) {
                                              setState(() {
                                                provider.addTotalPrice(
                                                    double.parse(provider
                                                        .cart[index].price
                                                        .toString()));
                                              });
                                            });
                                          },
                                          deleteQuantity: () {
                                            provider.deleteQuantity(
                                                provider.cart[index].id!);
                                            provider.removeTotalPrice(
                                                provider.cart[index].price);
                                          },
                                          text: value.toString());
                                    },
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  databaseHelper!
                                      .deleteCartItem(provider.cart[index].id!);
                                  provider.removeItem(provider.cart[index].id!);
                                  provider.removeCounter();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red.shade800,
                                )),
                          ]),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 3,
                      color: Colors.white,
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}

class PlusMinusButtons extends StatefulWidget {
  final VoidCallback addQuantity;
  final VoidCallback deleteQuantity;
  final String text;
  const PlusMinusButtons({
    Key? key,
    required this.addQuantity,
    required this.deleteQuantity,
    required this.text,
  }) : super(key: key);

  @override
  State<PlusMinusButtons> createState() => _PlusMinusButtonsState();
}

class _PlusMinusButtonsState extends State<PlusMinusButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(width: Dimensions.width16),
              InkWell(
                onTap: widget.deleteQuantity,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(
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
                widget.text,
                style: TextStyle(
                  fontSize: Dimensions.font15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: Dimensions.width16),
              InkWell(
                onTap: widget.addQuantity,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.3,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(
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
          )
        ]);
  }
}
