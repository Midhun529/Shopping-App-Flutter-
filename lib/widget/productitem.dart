import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soopershop/screen/detailscreen.dart';

import '../provider/product.dart';
import '../provider/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartItem>(context);

    return GridTile(
      child: InkWell(
          child: Image.network(product.imageUrl, fit: BoxFit.fill),
          onTap: () {
            return Navigator.of(context)
                .pushNamed(DetailScreen.name1, arguments: product.id);
          }),
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        leading: Consumer<Product>(
          builder: (context, product, child) => IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              return product.toInvert();
            },
          ),
        ),
        title: FittedBox(
          child: Container(
            padding: EdgeInsets.all(2),
            child: Text(
              product.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.amber[900],
                  fontSize: 700,
                  fontWeight: FontWeight.bold),
              softWrap: true,
            ),
          ),
        ),
        trailing: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              cart.cartAdd(product.id, product.name, product.price);
            }),
      ),
    );
  }
}
