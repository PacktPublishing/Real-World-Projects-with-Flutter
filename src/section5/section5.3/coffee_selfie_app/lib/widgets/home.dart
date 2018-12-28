import 'package:coffee_selfie_app/widgets/camera.dart';
import 'package:coffee_selfie_app/widgets/gallery.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<String> _paths = [
    'assets/img/starbucks01.jpeg',
    'assets/img/starbucks02.jpeg',
    'assets/img/starbucks03.jpeg',
    'assets/img/starbucks04.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Camera(),
        Align(
          alignment: Alignment(0, 0.95),
          child: Container(
            height: 100.0,
            child: Gallery(
              paths: _paths,
            ),
          ),
        ),
      ],
    );
  }
}
