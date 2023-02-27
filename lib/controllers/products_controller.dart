import 'dart:convert';

import 'package:flutter/services.dart';

class ProductsController {
  static Future<dynamic> readProductsData() async {
    final String response = await rootBundle.loadString('assets/json/products.json');
    final data = await jsonDecode(response);
    return data ?? [];
  }
  
}