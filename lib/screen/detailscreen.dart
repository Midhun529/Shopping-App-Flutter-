import 'package:flutter/material.dart';
import '../provider/products.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const name1 = "/detailScreen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final item = Provider.of<Products>(context).findId(id);
    final product = Products().findId(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.green[300]),
              margin: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              color: Colors.green[300],
              child: Row(
                children: <Widget>[
                  Text("price"),
                  Spacer(),
                  Text("\$${item.price}"),
                  TextButton(
                      onPressed: () {},
                      child:
                          Text("Order", style: TextStyle(color: Colors.white)))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Card(
                color: Colors.green[300],
                child: Text(item.discription),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
