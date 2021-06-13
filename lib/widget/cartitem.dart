import 'package:flutter/material.dart';
import '../provider/cart.dart';
import 'package:provider/provider.dart';

class CartProductItem extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final double quantity;
  CartProductItem(
    this.id,
    this.name,
    this.price,
    this.quantity,
  );
  @override
  Widget build(BuildContext context) {
    final object = Provider.of<CartItem>(context);
    final item = object.cartDisplay;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        color: Colors.green[400],
        elevation: 20,
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green[900],
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: FittedBox(
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => object.plusQuantity(id),
            ),
            Text(item[id].quantity.toString()),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => object.minusQuantity(id),
            ),
          ],
        ),
      ),
    );
  }
}
