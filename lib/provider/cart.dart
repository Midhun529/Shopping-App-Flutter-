import 'package:flutter/widgets.dart';

import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final String name;
  final double price;
  double quantity;
  Cart(this.id, this.name, this.price, this.quantity);
}

class CartItem with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get cartDisplay {
    return {..._items};
  }

  cartAdd(id, name, price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (cartItem) => Cart(
            cartItem.id, cartItem.name, cartItem.price, cartItem.quantity + 1),
      );
    } else {
      _items.putIfAbsent(id, () => Cart(id, name, price, 1));
    }
    notifyListeners();
  }

  totalPrice() {
    double total = 0;
    _items.forEach((key, value) {
      total = value.price * value.quantity;
    });
    return total;
  }

  minusQuantity(id) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (cartItem) => Cart(
            cartItem.id, cartItem.name, cartItem.price, cartItem.quantity - 1),
      );
      if (_items[id].quantity <= 0) {
        _items.remove(id);
      }
    }
    notifyListeners();
  }

  plusQuantity(id) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (cartItem) => Cart(
            cartItem.id, cartItem.name, cartItem.price, cartItem.quantity + 1),
      );
    }
    notifyListeners();
  }

  clearCart() {
    _items.clear();
    notifyListeners();
  }
}
