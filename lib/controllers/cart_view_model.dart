import 'package:flutter/cupertino.dart';
import 'package:suit_up/models/cart_model.dart';

class CartViewModel extends ChangeNotifier{
  List<CartProduct> _cartItems = [];

  ///Getting cart items
  List<CartProduct> get cartItems => _cartItems;


  set setCartITems(List<CartProduct> cartItems) => _cartItems = cartItems;


//Adding element to the cart
  void addToCart(CartProduct cartProduct) {
    for (var cartItem in _cartItems) {
      if (cartItem.id == cartProduct.id) {
        cartItem.quantity = cartItem.quantity+1;
      }
      _cartItems.add(cartProduct);
    }
    notifyListeners();
  }

  //Remove element from the cart
  void removeFromCart(int id) {
    for (var cartItem in _cartItems) {
      if (cartItem.id == id && cartItem.quantity > 1) {
        cartItem.quantity = cartItem.quantity-1;
      }
    
      _cartItems.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }

  //Removing all the element
  void removeCart() {
    _cartItems.clear();
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