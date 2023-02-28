import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suit_up/controllers/asset_manager.dart';
import 'package:suit_up/models/products_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';
import 'package:suit_up/screens/home/components/main_carousel_slider.dart';
import 'package:suit_up/screens/home/components/products_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  List products = [];
  ProductsModel productsModel = ProductsModel(products: []);

  ///
  @override
  void initState() {
    loadProductsData();
    super.initState();
  }

  Future<void> loadProductsData() async {
    final String response =
        await rootBundle.loadString('assets/json/products.json');
    final data = jsonDecode(response);
    setState(() {
      productsModel = ProductsModel.fromJson(data);
      products = data['products'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,

      appBar: AppBar(
        toolbarHeight: 60,
        title: CupertinoTextField(
          placeholder: 'Type here',
          prefix: const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.purple,
            ),
          ),
          controller: _searchController,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        actions: [
          SizedBox(
            height: 40,
            width: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.grey.shade300,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
            ),
          ),
          WidthCustom(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MainCarouselSlider(),
            HeightCustom(16),
            ProductsWidget(productsModel: productsModel)
          ],
        ),
      ),
    );
  }
}
