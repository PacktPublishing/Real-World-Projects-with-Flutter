import 'package:coffee_store_app/model/DrinksListModel.dart';
import 'package:coffee_store_app/widget/DrinksCarousel.dart';
import 'package:coffee_store_app/widget/DrinksList.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StoreHomePage extends StatelessWidget {

  final String title;

  const StoreHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DrinksListModel>(
      model: DrinksListModel(),
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            DrinksCarousel(),
            DrinksList(),
          ],
        ),
      ),
    );
  }
}
