import 'package:flutter/material.dart';
import 'package:soopershop/screen/productlistscreen.dart';
import '../screen/userscreen.dart';

class ShopDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello there!"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            selectedTileColor: Colors.green,
            leading: Text(
              "Main Screen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ProductListScreen.route3),
          ),
          Divider(),
          ListTile(
            selectedTileColor: Colors.green,
            leading: Text(
              "Editing Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(UserScreen.route),
          )
        ],
      ),
    );
  }
}
