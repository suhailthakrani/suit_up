import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  Products? products;

  ProductModel({this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    products =
        json['products'] != null ? Products.fromMap(json['products']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}

class Products {
  List<ProductCategory> productCategories = [];

  Products({
    required this.productCategories,
  });

  ProductCategory? getProductCategoryByName(String categoryName) {
    for (var category in productCategories) {
      if (category.categoryName == categoryName) {
        return category;
      }
    }
    return null;
  }

  Products copyWith({
    List<ProductCategory>? productCategories,
  }) {
    return Products(
      productCategories: productCategories ?? this.productCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productCategories': productCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    List<ProductCategory> productCategories = [];
    map.forEach(
      (key, value) {
        productCategories.add(ProductCategory.fromMap(key, value));
      },
    );
    return Products(productCategories: productCategories);
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Products(productCategories: $productCategories)';

  @override
  bool operator ==(covariant Products other) {
    if (identical(this, other)) return true;

    return listEquals(other.productCategories, productCategories);
  }

  @override
  int get hashCode => productCategories.hashCode;
}

class ProductCategory {
  final String categoryName;
  final List<Product> categoryProducts;
  ProductCategory({
    required this.categoryName,
    required this.categoryProducts,
  });

  ProductCategory copyWith({
    String? categoryName,
    List<Product>? categoryProducts,
  }) {
    return ProductCategory(
      categoryName: categoryName ?? this.categoryName,
      categoryProducts: categoryProducts ?? this.categoryProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryName': categoryName,
      'categoryProducts': categoryProducts.map((x) => x.toJson()).toList(),
    };
  }

  factory ProductCategory.fromMap(String name, List<dynamic> list) {
    return ProductCategory(
        categoryName: name,
        categoryProducts:
            List<Product>.from(list.map((e) => Product.fromJson(e))).toList());
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ProductCategory(categoryName: $categoryName, categoryProducts: $categoryProducts)';

  @override
  bool operator ==(covariant ProductCategory other) {
    if (identical(this, other)) return true;

    return other.categoryName == categoryName &&
        listEquals(other.categoryProducts, categoryProducts);
  }

  @override
  int get hashCode => categoryName.hashCode ^ categoryProducts.hashCode;
}

class Product {
  String? name;
  String? imageUrl;
  int? price;
  int? discount;
  String? category;
  String? description;

  Product(
      {this.name,
      this.imageUrl,
      this.price,
      this.discount,
      this.category,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    discount = json['discount'];
    category = json['category'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    data['discount'] = discount;
    data['category'] = category;
    data['description'] = description;
    return data;
  }
}
