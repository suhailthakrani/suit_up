import 'package:flutter/material.dart';
import 'package:suit_up/models/products_model.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      // height: 600,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productsModel.products.isNotEmpty
            ? productsModel.products.length
            : 0,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    productsModel.products[index].imageUrl ?? '',
                    // height: 130,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text('Rs. ${productsModel.products[index].price}'),
            ],
          );
        },
      ),
    );
  }
}
