import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../widget/cartitem.dart';

class CartScreen extends StatelessWidget {
  static const route2 = "/CartScreen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItem>(context);
    final item = cart.cartDisplay;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        actions: [],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.amberAccent,
              shadowColor: Colors.green[800],
              borderOnForeground: true,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Total Price"),
                    Spacer(),
                    Text("\$${cart.totalPrice()}")
                  ],
                ),
              ),
              margin: EdgeInsets.all(10),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, i) {
                  return CartProductItem(
                    item.values.toList()[i].id,
                    item.values.toList()[i].name,
                    item.values.toList()[i].price,
                    item.values.toList()[i].quantity,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () => cart.clearCart(),
        child: Icon(Icons.delete),
      ),
    );
  }
}
