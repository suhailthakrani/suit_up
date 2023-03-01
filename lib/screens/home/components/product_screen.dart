// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:suit_up/models/products_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/widgets/custom_text.dart';

class ProductScreen extends StatefulWidget {
  final Products product;
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double priceAfterDiscount = widget.product.price! -
        (widget.product.price! * widget.product.discount! / 100);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                widget.product.imageUrl ?? '',
                fit: BoxFit.cover,
                height: height * 0.6,
                width: width,
              ),
            ],
          ),
          Positioned(
            top: 35,
            right: 10,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(CupertinoIcons.heart),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.45,
            child: Container(
              height: height * 0.55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustom(
                        text: widget.product.name ?? '',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12)),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.minus,
                              ),
                            ),
                            Text('0'),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextCustom(
                            text: "Rs. ${priceAfterDiscount.toInt()}",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.red.shade900,
                          ),
                          WidthCustom(5),
                          TextCustom(
                            text: "${widget.product.price}",
                            // fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black87,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          WidthCustom(5),
                          TextCustom(
                            text: '300+ Reviews',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      )
                    ],
                  ),
                  HeightCustom(8),
                  TextCustom(
                    text: 'Size',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                  HeightCustom(8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ProductSize.values
                        .map((e) => Container(
                              height: 40,
                              width: 55,
                              padding: EdgeInsets.only(right: 3),
                              child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: TextCustom(
                                    text: e.name,
                                    fontSize: 16,
                                  )),
                            ))
                        .toList(),
                  ),
                  HeightCustom(8),
                  TextCustom(
                    text: 'Colors',
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  HeightCustom(8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: colors.map((e) {
                      return Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.only(right: 8),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: e,
                        ),
                      );
                    }).toList(),
                  ),
                  HeightCustom(8),
                  TextCustom(
                    text: 'Description',
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  HeightCustom(8),
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

  static List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.indigo
  ];
}

enum ProductSize { S, M, L, XL, XXL }

enum PColors { blue, red, green, purple, pink, voilet }
