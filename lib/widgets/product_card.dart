import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suit_up/db/db_helper.dart';
import 'package:suit_up/db/cart_provider.dart';
import 'package:suit_up/models/cart_model.dart';
import 'package:suit_up/models/product_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/screens/home/components/product_details_screen.dart';
import 'package:suit_up/utils/dimensions.dart';
import 'package:suit_up/widgets/custom_text.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  DatabaseHelper dbHelper = DatabaseHelper.db;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    void saveData(CartProduct cartProduct) {
      dbHelper.insert(cartProduct).then((value) {
        cart.addTotalPrice(cartProduct.price.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

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
                      builder: (context) =>
                          ProductDetailsScreen(product: widget.product),
                    ),
                  );
                },
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius12),
                    child: Image.asset(
                      widget.product.imageUrl ?? '',
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
                            widget.product.name ?? '',
                            softWrap: true,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.purple,
                              fontWeight: FontWeight.w500,
                              fontSize: Dimensions.font18,
                            ),
                          ),
                          TextCustom(
                            text: 'Rs. ${widget.product.price}',
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
                          onPressed: () {
                            // Adding items to the cart

                            saveData(
                              CartProduct(
                                name: widget.product.name!,
                                imageUrl: widget.product.imageUrl!,
                                price: widget.product.price!,
                                category: widget.product.category!,
                                size: widget.product.size!,
                                color: widget.product.color!,
                                quantity: ValueNotifier(1),
                              ),
                            );
                          },
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
                text: "${widget.product.discount} % OFF",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.font11,
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
