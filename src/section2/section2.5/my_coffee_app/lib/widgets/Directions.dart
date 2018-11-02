import 'package:flutter/material.dart';

class Directions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/img/directions.png',
              height: 20.0,
              width: 20.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 5.0),
              child: Text(
                'Directions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
