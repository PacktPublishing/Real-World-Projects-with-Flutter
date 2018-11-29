import 'package:cafe_scanner_app/widget/ProductForm.dart';
import 'package:flutter/material.dart';

class QrForm extends StatefulWidget {
  @override
  _QrFormState createState() => _QrFormState();
}

class _QrFormState extends State<QrForm> {
  @override
  Widget build(BuildContext context) {
    return ProductForm(
      category: 'Id',
    );
  }
}
