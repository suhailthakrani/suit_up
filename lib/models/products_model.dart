class ProductsModel {
  List<Products> products = [];

  ProductsModel({required this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        // ignore: unnecessary_new
        products.add(new Products.fromJson(v));
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

class Products {
  String? name;
  String? imageUrl;
  int? price;
  int? discount;
  String? category;

  Products(
      {this.name, this.imageUrl, this.price, this.discount, this.category});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    discount = json['discount'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    data['discount'] = discount;
    data['category'] = category;
    return data;
  }
}
