import 'package:flutter/material.dart';
import 'package:my_coffee_app/config/Config.dart';
import 'package:my_coffee_app/widgets/Directions.dart';
import 'package:url_launcher/url_launcher.dart';

class CoffeeCard extends StatelessWidget {

  CoffeeCard({this.shopName, this.shopImage});

  final String shopImage;
  final String shopName;
  static const _endpoint =
      'https://maps.googleapis.com/maps/api/place/photo';

  String _placesPhotoApi() {
    return _endpoint + '?maxheight=' + '150' + '&photoreference=' +
      shopImage + '&key=' + apiKey;
  }

  void _callDirections() async {
    final url = 'https://www.google.com/maps/dir/?api=1&destination=' +
      shopName;

    if(await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      width: 300.0,
      child: Card(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            Image.network(
              _placesPhotoApi(),
              height: 150.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    shopName,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: _callDirections,
                    child: Material(
                      elevation: 12.0,
                      child: Directions(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
