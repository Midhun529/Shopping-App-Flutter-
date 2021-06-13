import 'package:flutter/material.dart';

class EnterOrEdit extends StatefulWidget {
  static const value4 = "/Edit";
  @override
  _EnterOrEditState createState() => _EnterOrEditState();
}

class _EnterOrEditState extends State<EnterOrEdit> {
  final priceFocusNode = FocusNode();
  final discriptionFocusNode = FocusNode();
  final urlFocusNode = FocusNode();
  final imageController = TextEditingController();
  @override
  void initState() {
    urlFocusNode.addListener(updateImage);
    super.initState();
  }

  @override
  void dispose() {
    priceFocusNode.dispose();
    discriptionFocusNode.dispose();
    urlFocusNode.dispose();
    imageController.dispose();
    super.dispose();
  }

  void updateImage() {
    if (!urlFocusNode.hasFocus) {
      setState(() {});
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Enter Product Details"),
        ),
        body: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Name of the product"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(priceFocusNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Price of the product"),
                textInputAction: TextInputAction.next,
                focusNode: priceFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(discriptionFocusNode);
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: "Description of the product"),
                textInputAction: TextInputAction.next,
                focusNode: discriptionFocusNode,
                maxLines: 4,
                onFieldSubmitted: (value) {
                  urlFocusNode;
                },
              ),
              Row(children: [
                Container(
                  height: 100,
                  width: 100,
                  child: (imageController.text == "")
                      ? Text("enter Url", softWrap: true)
                      : Image.network(
                          imageController
                              .text, //'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flower_poster_2.jpg/495px-Flower_poster_2.jpg',
                          fit: BoxFit.fill,
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Url of the product's image"),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.url,
                    focusNode: urlFocusNode,
                    onFieldSubmitted: (value) {
                      setState(() {});
                    },
                    controller: imageController,
                  ),
                )
              ])
            ],
          ),
        ));
  }
}
