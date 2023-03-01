// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:suit_up/models/products_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/widgets/custom_text.dart';

class ProductScreen extends StatefulWidget {
  // final Products product;
  const ProductScreen({
    Key? key,
    // required this.product,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // Image(image: AssetImage(widget.product.imageUrl?? ''),),
          Column(
            children: [
              Image.asset(
                'assets/images/c9.jpg',
                fit: BoxFit.cover,
                height: height * 0.6,
                width: width,
              ),
            ],
          ),
          Positioned(
            top: 30,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_back_ios),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(CupertinoIcons.heart),
                ),
              ],
            ),
          ),

          Positioned(
            top: height * 0.5,
            child: Container(
              height: height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustom(
                        text: 'Product Name',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(color: Colors.pink),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.minus,
                              ),
                            ),
                            Text("Q"),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.plus,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextCustom(text: 'Rs. Price'),
                      WidthCustom(5),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      WidthCustom(5),
                      TextCustom(text: '(300 Reviews)')
                    ],
                  ),
                  TextCustom(
                    text: 'Size',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ProductSize.values
                        .map((e) => Container(
                              height: 40,
                              width: 55,
                              padding: EdgeInsets.only(right: 3),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  child: TextCustom(
                                    text: e.name,
                                    fontSize: 10,
                                  )),
                            ))
                        .toList(),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: PColors.values.map((e) {
                      final color = e.name;
                      return Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.only(right: 8),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      );
                    }).toList(),
                  ),
                  TextCustom(
                    text: 'Description',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  Expanded(
                    child: TextCustom(
                        textAlign: TextAlign.justify,
                        text:
                            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Dis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'''),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum ProductSize { S, M, L, XL, XXL }

enum PColors { blue, red, green, purple, pink, voilet }
