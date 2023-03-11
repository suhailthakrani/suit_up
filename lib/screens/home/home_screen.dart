import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:suit_up/controllers/asset_manager.dart';
import 'package:suit_up/models/product_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/screens/home/components/main_carousel_slider.dart';
import 'package:suit_up/screens/home/components/products_screen.dart';
import 'package:suit_up/utils/dimensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _searchController = TextEditingController();

  ProductModel productModel =
      ProductModel(products: Products(productCategories: []));

  late TabController _tabBarController;
  int selected = 0;

  ///
  @override
  void initState() {
    _tabBarController = TabController(length: 4, vsync: this);
    init();
    super.initState();
  }

  init() async {
    productModel = await loadProductsData();
    setState(() {});
  }

  Future<ProductModel> loadProductsData() async {
    final String response =
        await rootBundle.loadString('assets/json/products.json');
    final data = jsonDecode(response);

    return ProductModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,

      appBar: AppBar(
        toolbarHeight: Dimensions.height60,
        automaticallyImplyLeading: false,
        // backgroundColor: ThemeManager().isDark ? Colors.black : Colors.white60,
        title: CupertinoTextField(
          placeholder: 'Type here',
          suffix: Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width5,
              bottom: 2,
              top: 3,
              right: 5,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.purple,
            ),
          ),
          controller: _searchController,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(Dimensions.radius12),
          ),
        ),
        actions: [
          SizedBox(
            height: Dimensions.width35,
            width: Dimensions.width35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.grey.shade300,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
              ),
              onPressed: () {},
              child: const Icon(
                Icons.notifications,
              ),
              // child: Badge(
              //   label: Consumer<CartProvider>(
              //     builder: (context, value, child) {
              //       return Text(
              //         value.getCounter().toString(),
              //         style: const TextStyle(
              //             color: Colors.white, fontWeight: FontWeight.bold),
              //       );
              //     },
              //   ),
              //   child: const Icon(
              //     CupertinoIcons.cart,
              //   ),
              // ),
            ),
          ),
          WidthCustom(Dimensions.width10),
        ],
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MainCarouselSlider(),
            TabBar(
              physics: const BouncingScrollPhysics(),
              controller: _tabBarController,
              // indicator: BoxDecoration(
              //   borderRadius: BorderRadius.circular(12),
              //   color: Colors.purple.shade600,/
              // ),
              tabs: const [
                Tab(
                  child: Text("Women"),
                ),
                Tab(
                  child: Text("Men"),
                ),
                Tab(
                  child: Text("Girls"),
                ),
                Tab(
                  child: Text("Boys"),
                ),
              ],
            ),
            HeightCustom(Dimensions.height5),
            Flexible(
              child: TabBarView(
                controller: _tabBarController,
                children: [
                  ProductsScreen(
                      productCategory: productModel.products!
                              .getProductCategoryByName('women') ??
                          ProductCategory(
                              categoryName: '', categoryProducts: [])),
                  ProductsScreen(
                      productCategory: productModel.products!
                              .getProductCategoryByName('men') ??
                          ProductCategory(
                              categoryName: '', categoryProducts: [])),
                  ProductsScreen(
                      productCategory: productModel.products!
                              .getProductCategoryByName('girls') ??
                          ProductCategory(
                              categoryName: '', categoryProducts: [])),
                  ProductsScreen(
                      productCategory: productModel.products!
                              .getProductCategoryByName('boys') ??
                          ProductCategory(
                              categoryName: '', categoryProducts: [])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
