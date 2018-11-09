import 'package:flutter/material.dart';
import 'package:coffee_store_app/widget/StoreHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

