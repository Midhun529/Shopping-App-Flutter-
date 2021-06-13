import 'package:flutter/material.dart';
import '../widget/shopdrawer.dart';
import '../provider/products.dart';
import 'package:provider/provider.dart';
import '../widget/userscreenitem.dart';
import './enteredit.dart';

//edit cheyan productukale display cheyan
class UserScreen extends StatelessWidget {
  static const route = "/UserScreen";
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(EnterOrEdit.value4))
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return Column(children: <Widget>[
            UserScreenItem(
              products[i].id,
            ),
            Divider()
          ]);
        },
      ),
      drawer: ShopDrawer(),
    );
  }
}
