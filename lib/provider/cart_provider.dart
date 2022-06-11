import 'package:flutter/cupertino.dart';
import 'package:flutter_eticaret/models/cart_attribute.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttribute> _cartItems = {};

  Map<String, CartAttribute> get getCartItem {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;

    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }

  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (extingCartItem) => CartAttribute(
          id: extingCartItem.id,
          title: extingCartItem.title,
          price: extingCartItem.price,
          quantity: extingCartItem.quantity + 1,
          imageUrl: extingCartItem.imageUrl,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttribute(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void reductCartItem(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(productId, (exitingCartItem) {
        return CartAttribute(
            id: exitingCartItem.id,
            title: exitingCartItem.title,
            quantity: exitingCartItem.quantity - 1,
            price: exitingCartItem.price,
            imageUrl: exitingCartItem.imageUrl);
      });
    }
    notifyListeners();
  }

  void removeCartItem(productId) {
    _cartItems.remove(productId);

    notifyListeners();
  }

  void clearCartData() {
    _cartItems.clear();

    notifyListeners();
  }
}
