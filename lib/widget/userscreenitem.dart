import 'package:flutter/material.dart';
import 'package:soopershop/screen/enteredit.dart';
import '../provider/products.dart' as pro;
import 'package:provider/provider.dart';

class UserScreenItem extends StatelessWidget {
  final String id;

  UserScreenItem(this.id);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<pro.Products>(context);
    final product = products.findId(id);
    return ListTile(
      title: Text(product.name),
      leading: CircleAvatar(
        child: Image.network(product.imageUrl, fit: BoxFit.fill),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => showDialog(
                      context: context,
                      builder: (cont) => AlertDialog(
                        title: Text("Do You Want delete"),
                        content:
                            Text("if you want to delete press 'yes' else 'no'"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Yes"),
                            onPressed: () {
                              products.deleteProduct(id);
                              Navigator.of(context).pop(false);
                            },
                          ),
                          FlatButton(
                            child: Text("No"),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      ),
                    )),
            IconButton(
              icon: Icon(
                Icons.edit,
              ),
              onPressed: () {
                return Navigator.of(context).pushNamed(EnterOrEdit.value4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
