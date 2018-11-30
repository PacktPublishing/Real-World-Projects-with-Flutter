import 'dart:convert';

import 'package:cafe_scanner_app/model/Product.dart';
import 'package:cafe_scanner_app/widget/ProductForm.dart';
import 'package:flutter/material.dart';

enum formState {id, name, price}

class QrForm extends StatefulWidget {

  final Function(String) serializedCallback;

  const QrForm({Key key, this.serializedCallback}) : super(key: key);

  @override
  _QrFormState createState() => _QrFormState();
}

class _QrFormState extends State<QrForm> {

  var _state = formState.id;
  int _id;
  String _name;
  double _price;

  void _formCallback(value) {
    formState state;
    switch(_state) {
      case formState.id:
        state = formState.name;
        _id = int.parse(value);
        break;
      case formState.name:
        state = formState.price;
        _name = value;
        break;
      case formState.price:
        state = formState.id;
        _price = double.parse(value);
        var product = Product(_id, _name, _price);
        var serializedProduct = json.encode(product);
        widget.serializedCallback(serializedProduct);
        break;
    }
    setState(() {
      _state = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_state) {
      case formState.id:
        return ProductForm(
          category: 'Id',
          productCallback: _formCallback,
        );
      case formState.name:
        return ProductForm(
          category: 'Name',
          productCallback: _formCallback,
        );
      case formState.price:
        return ProductForm(
          category: 'Price',
          productCallback: _formCallback,
        );
    }
  }
}
