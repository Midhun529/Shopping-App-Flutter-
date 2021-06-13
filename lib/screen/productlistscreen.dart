import 'package:flutter/material.dart';

import 'package:soopershop/widget/grid.dart';

import '../screen/cartscreen.dart';
import '../widget/shopdrawer.dart';

class ProductListScreen extends StatefulWidget {
  static const route3 = "/ProductListScreen";

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (cnt) => [
              PopupMenuItem(child: Text("Main Screen"), value: 1),
              PopupMenuItem(child: Text("favourates"), value: 2)
            ],
            onSelected: (value) {
              setState(() {
                if (value == 1) {
                  fav = false;
                } else {
                  fav = true;
                }
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(
                CartScreen.route2,
              );
            },
          )
        ],
        title: Text((fav == false) ? "Plants" : "Favourate Plants"),
      ),
      drawer: ShopDrawer(),
      body: Grid(fav),
    );
  }
}
