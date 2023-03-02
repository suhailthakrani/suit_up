// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:suit_up/models/products_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/screens/home/components/product_screen.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/custom_text.dart';
import 'package:suit_up/widgets/product_card.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount:
          productsModel.products.isNotEmpty ? productsModel.products.length : 0,
      itemBuilder: (context, index) {
        return ProductCard(product: productsModel.products[index]);
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
