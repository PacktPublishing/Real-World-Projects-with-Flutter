import 'package:coffee_selfie_app/api/storage.dart';
import 'package:coffee_selfie_app/widgets/camera.dart';
import 'package:coffee_selfie_app/widgets/gallery.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> _paths = [
  ];

  void _updateGallery() {
    Storage.getFilePaths().then((paths) {
      setState(() {
        _paths = paths;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Storage.getFilePaths().then((paths) {
      setState(() {
        _paths = paths;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Camera(
          captureCallback: _updateGallery,
        ),
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
