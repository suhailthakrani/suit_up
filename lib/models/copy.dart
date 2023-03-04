import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductModel {
  Products? products;

  ProductModel({
    this.products,
  });

  ProductModel copyWith({
    Products? products,
  }) {
    return ProductModel(
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products?.toJson(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      products:
          map['products'] != null ? Products.fromJson(map['products']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductModel(products: $products)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.products == products;
  }

  @override
  int get hashCode => products.hashCode;
}

class Products {
  final List<ProductCategory> productCategories;
  Products({
    required this.productCategories,
  });
  ProductCategory? getProductCategoryByName(String name) {
    for (var category in productCategories) {
      if (category.categoryName == name) {
        return category;
      }
    }
    return null;
  }

  factory Products.fromJson(Map<String, dynamic> map) {
    List<ProductCategory> productCategories = [];
    map.forEach(
      (key, value) {
        productCategories.add(
          ProductCategory.fromJson(key, value),
        );
      },
    );
    return Products(
      productCategories: productCategories,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productCategories != null) {
      data['products'] = productCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCategory {
  List<Product>? products;
  final String categoryName;

  ProductCategory({
    this.products,
    required this.categoryName,
  });

  ProductCategory.fromJson(this.categoryName, Map<String, dynamic> json) {
    if (json[categoryName] != null) {
      products = <Product>[];
      json[categoryName].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data[categoryName] = products!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Women {
  String? name;
  String? imageUrl;
  int? price;
  int? discount;
  String? category;
  String? description;

  Women(
      {this.name,
      this.imageUrl,
      this.price,
      this.discount,
      this.category,
      this.description});

  Women.fromJson(Map<String, dynamic> json) {
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

class Men {
  String? name;
  String? imageUrl;
  int? price;
  int? discount;
  String? category;
  String? description;

  Men(
      {this.name,
      this.imageUrl,
      this.price,
      this.discount,
      this.category,
      this.description});

  Men.fromJson(Map<String, dynamic> json) {
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

class Girls {
  String? name;
  String? imageUrl;
  int? price;
  int? discount;
  String? category;
  String? description;

  Girls(
      {this.name,
      this.imageUrl,
      this.price,
      this.discount,
      this.category,
      this.description});

  Girls.fromJson(Map<String, dynamic> json) {
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

class Boys {
  String? name;
  String? imageUrl;
  int? price;
  int? discount;
  String? category;
  String? description;

  Boys(
      {this.name,
      this.imageUrl,
      this.price,
      this.discount,
      this.category,
      this.description});

  Boys.fromJson(Map<String, dynamic> json) {
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

enum ProductCategoryEnum {
  women,
  men,
  girls,
  boys,
}
