// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:suit_up/models/product_model.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    Key? key,
    required this.productCategory,
  }) : super(key: key);

  final ProductCategory productCategory;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: productCategory.categoryProducts.isNotEmpty ? productCategory.categoryProducts.length : 0,
      itemBuilder: (context, index) {
        return ProductCard(product: (productCategory.categoryProducts[index]));
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: Dimensions.width10,
        mainAxisSpacing: Dimensions.width10,
      ),
    );
  }
}
