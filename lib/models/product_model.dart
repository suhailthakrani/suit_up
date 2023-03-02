// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  List<Product> products = [];

  ProductModel({required this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        // ignore: unnecessary_new
        products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products.isNotEmpty) {
      data['products'] = products.map((v) => v.toJson()).toList();
    }
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

  Product({
    this.name,
    this.imageUrl,
    this.price,
    this.discount,
    this.category,
    this.description,
  });

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
