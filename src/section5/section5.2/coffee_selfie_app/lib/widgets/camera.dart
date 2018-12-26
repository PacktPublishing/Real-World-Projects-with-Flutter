import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey,
        ),
        Center(
          child: FloatingActionButton(
            child: Icon(
              Icons.camera_alt,
              size: 36.0,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
