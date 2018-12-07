import 'package:cafe_scanner_app/model/Product.dart';
import 'package:flutter/material.dart';

class ProductDialog extends StatelessWidget {

  final Product product;

  const ProductDialog({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Qr Code Valuse'),
      content: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.info),
            title: Text(product.productId.toString()),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(product.productName),
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(product.productPrice.toString()),
          ),
        ],
      ),
    );
  }
}

