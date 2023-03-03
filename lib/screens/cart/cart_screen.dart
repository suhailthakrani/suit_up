import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/utils/dimensions.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart Screen"),
        ),
        body: LayoutBuilder(
          builder: (p0, p1) {
            return ListView.separated(
              padding: EdgeInsets.all(12),
              itemCount: 7,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: Dimensions.height50,
                        child: Image.asset('assets/images/c1.jpg'),
                      ),
                      WidthCustom(10),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Item Name",
                          ),
                          Text(
                            "Rs. Price",
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
  }
}
