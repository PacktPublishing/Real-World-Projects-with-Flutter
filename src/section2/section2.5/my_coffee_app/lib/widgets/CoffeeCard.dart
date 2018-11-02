import 'package:flutter/material.dart';
import 'package:my_coffee_app/config/Config.dart';
import 'package:my_coffee_app/widgets/Directions.dart';

class CoffeeCard extends StatelessWidget {

  CoffeeCard({this.shopName, this.shopImage});

  final String shopImage;
  final String shopName;
  static const _endpoint =
      'https://maps.googleapis.com/maps/api/place/photo';

  String _placesPhotoApi() {
    return _endpoint + '?maxheight=150&photoreference=' +
      shopImage + '&key=' + apiKey;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: 300.0,
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              _placesPhotoApi(),
              height: 150.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
            Row(
              children: <Widget>[
                Text(shopName),
                Directions()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
