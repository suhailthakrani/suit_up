class ProductModel1 {
  List<Product1> products = [];
  

  ProductModel1({required this.products});

  ProductModel1.fromJson(Map<String, dynamic> json) {
    if (json['ladies_products'] != null) {
      products = <Product1>[];
      json['ladies_products'].forEach((v) {
        // ignore: unnecessary_new
        products.add(new Product1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products.isNotEmpty) {
      data['ladies_products'] = products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product1 {
  String? name;
  String? imageUrl;
  int? price;
  int? discount;
  String? category;
  String? description;

  Product1({
    this.name,
    this.imageUrl,
    this.price,
    this.discount,
    this.category,
    this.description,
  });

  Product1.fromJson(Map<String, dynamic> json) {
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