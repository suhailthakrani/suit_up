import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suit_up/models/product_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/theme/theme_manager.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/custom_text.dart';

import '../../../theme/theme_constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double priceAfterDiscount = widget.product.price! -
        ((widget.product.discount! / 100) * (widget.product.price!));

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
            top: Dimensions.height35,
            right: Dimensions.width10,
            left: Dimensions.width10,
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
                  child: const Icon(CupertinoIcons.heart),
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius30),
                  topRight: Radius.circular(Dimensions.radius30),
                ),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width16,
                  vertical: Dimensions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustom(
                        text: widget.product.name ?? '',
                        fontSize: Dimensions.font24,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade200),
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.minus,
                            ),
                          ),
                          WidthCustom(5),
                          const Text('0'),
                          WidthCustom(5),
                          IconButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade200),
                            icon: const Icon(
                              CupertinoIcons.plus,
                            ),
                          )
                        ],
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
                            fontSize: Dimensions.font20,
                            color: Colors.red.shade900,
                          ),
                          WidthCustom(5),
                          TextCustom(
                            text: "${widget.product.price}",
                            // fontWeight: FontWeight.w500,
                            fontSize: Dimensions.font18,
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
                            fontSize: Dimensions.font12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      )
                    ],
                  ),
                  HeightCustom(Dimensions.height8),
                  TextCustom(
                    text: 'Size',
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                  HeightCustom(Dimensions.height8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ProductSize.values
                        .map((e) => Container(
                              height: Dimensions.height40,
                              width: Dimensions.height50 + 5,
                              padding: const EdgeInsets.only(right: 3),
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
                  HeightCustom(Dimensions.height8),
                  TextCustom(
                    text: 'Colors',
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  HeightCustom(Dimensions.height8),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: colors.map((e) {
                      return Container(
                        height: Dimensions.height30,
                        width: Dimensions.width30,
                        padding: EdgeInsets.only(right: Dimensions.height8),
                        margin: EdgeInsets.only(right: Dimensions.height8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.purple),
                          color: e,
                        ),
                      );
                    }).toList(),
                  ),
                  HeightCustom(Dimensions.height8),
                  TextCustom(
                    text: 'Description',
                    color: Colors.grey.shade700,
                    fontSize: Dimensions.font16,
                    fontWeight: FontWeight.w600,
                  ),
                  HeightCustom(Dimensions.height8),
                  Expanded(
                      child: TextCustom(
                    textAlign: TextAlign.justify,
                    text: widget.product.description ?? '',
                    color: ThemeManager().isDark
                        ? AppTheme.darkTheme.primaryColor
                        : AppTheme.lightTheme.primaryColor,
                  ))
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: TextCustom(
                  text: "Add to Card",
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }

  static List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.indigo,
    Colors.deepPurple
  ];
}

enum ProductSize { S, M, L, XL, XXL }

enum PColors { blue, red, green, purple, pink, voilet }
