import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suit_up/models/products_model.dart';
import 'package:suit_up/widgets/custom_text.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount:
          productsModel.products.isNotEmpty ? productsModel.products.length : 0,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 5,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            InkWell(
              onTap: () {
                print(productsModel.products[index].imageUrl);
              },
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    productsModel.products[index].imageUrl ?? '',
                    height: 170,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 10,
                right: 20,
                child: Container(
                  alignment: Alignment.center,
                  height: 24,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.redAccent,
                  ),
                  child: CustomText(
                    text: "${productsModel.products[index].discount} % OFF",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                )),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: productsModel.products[index].name ?? '',
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      CustomText(
                        text: 'Rs. ${productsModel.products[index].price}',
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.cart,
                          size: 24,
                          color: Colors.purple,
                        )),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
