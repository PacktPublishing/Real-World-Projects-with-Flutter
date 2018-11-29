import 'package:cafe_scanner_app/widget/Create.dart';
import 'package:cafe_scanner_app/widget/Scan.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.scanner),),
                Tab(icon: Icon(Icons.create),),
              ],
            ),
            title: Text('Cafe Scanner'),
          ),
          body: TabBarView(
              children: [
                Scan(),
                Create(),
              ],
          ),
        ),
      ),
    );
  }
}

