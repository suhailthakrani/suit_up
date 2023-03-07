// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CartModel {
  List<CartProduct>? cartItems;
  CartModel({
    this.cartItems,
  });

  CartModel copyWith({
    List<CartProduct>? cartItems,
  }) {
    return CartModel(
      cartItems: cartItems ?? this.cartItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cartItems': cartItems!.map((x) => x.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      cartItems: map['cartItems'] != null ? List<CartProduct>.from((map['cartItems'] as List<int>).map<CartProduct?>((x) => CartProduct.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) => CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartModel(cartItems: $cartItems)';

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.cartItems, cartItems);
  }

  @override
  int get hashCode => cartItems.hashCode;
}
class CartProduct {
  final int? id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String size;
  final String color;
  ValueNotifier<int>? quantity;
  CartProduct({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.size,
    required this.color,
    required this.quantity,
  });



  CartProduct copyWith({
    int? id,
    String? name,
    String? imageUrl,
    double? price,
    String? category,
    String? size,
    String? color,
    ValueNotifier<int>? quantity,
  }) {
    return CartProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      category: category ?? this.category,
      size: size ?? this.size,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'category': category,
      'size': size,
      'color': color,
      'quantity': quantity?.value,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      size: map['size'] as String,
      color: map['color'] as String,
      quantity: map['quantity'] != null ? ValueNotifier(map['quantity']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduct.fromJson(String source) => CartProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartProduct(id: $id, name: $name, imageUrl: $imageUrl, price: $price, category: $category, size: $size, color: $color, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant CartProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.imageUrl == imageUrl &&
      other.price == price &&
      other.category == category &&
      other.size == size &&
      other.color == color &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      imageUrl.hashCode ^
      price.hashCode ^
      category.hashCode ^
      size.hashCode ^
      color.hashCode ^
      quantity.hashCode;
  }
}
