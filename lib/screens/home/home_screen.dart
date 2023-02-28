import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suit_up/controllers/asset_manager.dart';
import 'package:suit_up/models/products_model.dart';
import 'package:suit_up/screens/authentication/sign_up_screen.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(height: 150),
                  items: [1, 2, 3, 4, 5].map((e) {
                    return Builder(
                      builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              AssetManager.cardImage,
                              height: 120,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList()),
              HeightCustom(16),
              SizedBox(
                height: 600,
                child: GridView.builder(
                  itemCount: productsModel.products.isNotEmpty
                      ? productsModel.products.length
                      : 0,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
