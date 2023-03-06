import 'package:flutter/cupertino.dart';
import 'package:suit_up/models/cart_model.dart';

class CartViewModel with ChangeNotifier {
  List<CartProduct> _cartItems = [];

  ///Getting cart items
  List<CartProduct> get cartItems => _cartItems;

  set setCartITems(List<CartProduct> cartItems) => _cartItems = cartItems;

//Adding element to the cart
  void addToCart(CartProduct cartProduct) {
    bool found = false;
    for (var cartItem in _cartItems) {
      if (cartItem.name == cartProduct.name) {
        cartItem.quantity = cartItem.quantity + 1;
        found = true;
        break;
        
      }
      if (!found) {
        _cartItems.add(cartProduct);
        
      }
    }
    notifyListeners();
  }

  //Remove element from the cart
  void removeFromCart(String name) {
    for (var cartItem in _cartItems) {
      if (cartItem.name == name && cartItem.quantity > 1) {
        cartItem.quantity = cartItem.quantity - 1;
      }

      _cartItems.removeWhere((element) => element.name == name);
    }
    notifyListeners();
  }

  //Removing all the element
  void removeCart() {
    _cartItems.clear();
    notifyListeners();
  }

  //Getting total price
  double totalPrice() {
    double totalPrice = 0.0;
    for (var cartItem in _cartItems) {
      totalPrice += cartItem.price * cartItem.quantity;
    }
    return totalPrice;
  }
}
