// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:suit_up/models/product_model.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/product_card.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount:
          productModel.products.isNotEmpty ? productModel.products.length : 0,
      itemBuilder: (context, index) {
        return ProductCard(product: productModel.products[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: Dimensions.width10,
        mainAxisSpacing: Dimensions.width10,
      ),
    );
  }
}
