import 'package:flutter/material.dart';
import 'package:my_coffee_app/widgets/MyMapPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Coffee Shops',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyMapPage(title: 'My Coffee Shops'),
    );
  }
}

