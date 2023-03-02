import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suit_up/models/products_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/screens/home/components/product_screen.dart';
import 'package:suit_up/utils/dimensions.dart';
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 0.7,
        crossAxisSpacing: Dimensions.width10,
        mainAxisSpacing: Dimensions.width10,
      ),
      itemBuilder: (context, index) {
        return Container(
          // color: Colors.amber,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                              product: productsModel.products[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.amber,
                      // margin: index % 2 == 0
                      //     ? EdgeInsets.only(left: Dimensions.height16)
                      //     : EdgeInsets.only(
                      //         right: Dimensions.width10,
                      //         left: Dimensions.width5),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius12),
                        child: Image.asset(
                          productsModel.products[index].imageUrl ?? '',
                          height: Dimensions.height220,
                          width: MediaQuery.of(context).size.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  HeightCustom(Dimensions.height8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productsModel.products[index].name ?? '',
                                softWrap: true,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dimensions.font18,
                                ),
                              ),
                              TextCustom(
                                text:
                                    'Rs. ${productsModel.products[index].price}',
                                color: Colors.grey.shade900,
                                fontWeight: FontWeight.w500,
                                fontSize: Dimensions.font13,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: Dimensions.height45,
                          width: Dimensions.height45,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius40),
                            color: Colors.grey.shade200,
                          ),
                          child: IconButton(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              icon: Icon(
                                CupertinoIcons.cart,
                                size: Dimensions.iconSize24,
                                color: Colors.purple,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 4,
                right: index % 2 == 0
                    ? Dimensions.width10 - 4
                    : Dimensions.height10,
                child: Container(
                  alignment: Alignment.center,
                  height: Dimensions.height30,
                  width: Dimensions.height60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius12),
                      topRight: Radius.circular(Dimensions.radius12),
                    ),
                    color: Colors.redAccent,
                  ),
                  child: TextCustom(
                    text: "${productsModel.products[index].discount} % OFF",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.font12,
                  ),
                ),
              ),
              Positioned(
                top: Dimensions.width5,
                left: Dimensions.height16,
                child: Container(
                  height: Dimensions.height30 + 2,
                  width: Dimensions.height30 + 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius40),
                    color: Colors.grey.shade200,
                  ),
                  child: IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      icon: Icon(
                        CupertinoIcons.heart,
                        size: Dimensions.iconSize24,
                        color: Colors.purple,
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
