import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String discription;
  final double price;
  final String name;
  final String imageUrl;
  bool isFavorite;
  Product(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.discription,
      @required this.imageUrl,
      this.isFavorite = false});

  toInvert() {
    if (isFavorite == false) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }
    notifyListeners();
  }
}
