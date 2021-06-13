import 'package:flutter/material.dart';
import './screen/detailscreen.dart';
import './screen/enteredit.dart';
import './screen/productlistscreen.dart';
import "package:provider/provider.dart";
import './provider/products.dart';
import './screen/cartscreen.dart';
import './provider/cart.dart';
import './screen/userscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: CartItem()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            accentColor: Colors.yellow[800],
            primarySwatch: Colors.green,
          ),
          home: ProductListScreen(),
          routes: {
            ProductListScreen.route3: (context) {
              return ProductListScreen();
            },
            DetailScreen.name1: (context) {
              return DetailScreen();
            },
            CartScreen.route2: (context) {
              return CartScreen();
            },
            UserScreen.route: (context) => UserScreen(),
            EnterOrEdit.value4: (context) => EnterOrEdit(),
          }),
    );
  }
}
