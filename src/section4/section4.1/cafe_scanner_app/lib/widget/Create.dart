import 'package:cafe_scanner_app/widget/QrCodeImage.dart';
import 'package:cafe_scanner_app/widget/QrForm.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        QrForm(),
        QrCodeImage(),
      ],
    );
  }
}
