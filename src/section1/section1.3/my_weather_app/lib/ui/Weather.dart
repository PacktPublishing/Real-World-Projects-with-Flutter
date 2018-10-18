import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget dateSection = Container(
      child: Text(
        DateFormat('MMMM d, H:m').format(DateTime.now()),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
    );

    Widget tempSection = Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '20',
            style: TextStyle(
              fontSize: 80.0,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 12.0,
              ),
              margin: EdgeInsets.only(
                left: 6.0,
              ),
              child: Text(
                '\u2103',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/img/cloudy.png',
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );

    Widget descriptionSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tokyo',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Cloudy',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dateSection,
          tempSection,
          descriptionSection,
        ],
      ),
    );
  }

}