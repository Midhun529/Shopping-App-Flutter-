import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';
import "../widget/productitem.dart";

class Grid extends StatelessWidget {
  final bool fav;
  Grid(this.fav);
  @override
  Widget build(BuildContext context) {
    final providerObject = Provider.of<Products>(context);
    final productList = (fav) ? providerObject.favItem() : providerObject.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: productList.length,
      itemBuilder: (cntxt, i) {
        return ChangeNotifierProvider.value(
          value: productList[i],
          child: ProductItem(
              /* name: productList[i].name,
          price: productList[i].price,
          imageUrl: productList[i].imageUrl,*/
              ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
