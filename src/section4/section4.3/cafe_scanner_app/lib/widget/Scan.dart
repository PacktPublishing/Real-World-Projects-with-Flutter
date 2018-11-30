import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  width: 250,
                  height: 250,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.camera_alt,
            size: 50,
          ),
        )
      ],
    );
  }
}
