import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suit_up/models/product_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/screens/home/components/product_details_screen.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/custom_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
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
                      builder: (context) => ProductDetailsScreen(product: product),
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
                    borderRadius: BorderRadius.circular(Dimensions.radius12),
                    child: Image.asset(
                      product.imageUrl ?? '',
                      height: Dimensions.height200,
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
                            product.name ?? '',
                            softWrap: true,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.purple,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimensions.font18,
                            ),
                          ),
                          TextCustom(
                            text: 'Rs. ${product.price}',
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
            right: Dimensions.height10 - 4,
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
                text: "${product.discount} % OFF",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.font12,
              ),
            ),
          ),
          Positioned(
            top: Dimensions.width10,
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
  }
}
