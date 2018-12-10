import 'package:cafe_scanner_app/model/Product.dart';
import 'package:flutter/material.dart';

class ScannedProduct extends StatelessWidget {

  final Product product;

  const ScannedProduct({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(product != null)
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: SizedBox(
          width: 200,
          height: 250,
          child: Card(
            child: Column(
              children: <Widget>[
                Text('Qr Code Values'),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text(product.productId.toString()),
                    ),
                    ListTile(
                      leading: Icon(Icons.shop),
                      title: Text(product.productName.toString()),
                    ),
                    ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(product.productPrice.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    else
      return Container();
  }
}
