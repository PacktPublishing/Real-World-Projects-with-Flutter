import 'dart:async';

import 'package:coffee_selfie_app/api/storage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {

  final Function() captureCallback;

  const Camera({Key key, this.captureCallback}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

  List<CameraDescription> cameras;
  CameraController _controller;
  bool isCameraInitialized = false;

  void _initializeController() {
    _controller = CameraController(cameras[1], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if(!mounted)
        return;
      setState(() {
        isCameraInitialized = true;
      });
    });
  }

  _getCameras() async {
    cameras = await availableCameras();
    if(cameras.length > 0)
      _initializeController();
  }

  @override
  void initState() {
    super.initState();
    _getCameras();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> _captureImage() async {
    var path = await Storage.getFilePath();
    var completer = Completer<String>();
    if(!_controller.value.isTakingPicture)
      try {
        await _controller.takePicture(path);
        widget.captureCallback();
        completer.complete(path);
      }  on CameraException catch(e) {
      throw Exception('Failed to capture image: $e');
      }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    if(!isCameraInitialized)
      return Container();
    else
      return Stack(
        children: <Widget>[
          Transform.scale(
            scale: _controller.value.aspectRatio / deviceRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CameraPreview(_controller),
              ),
            ),
          ),
          Center(
            child: Theme(
              data: ThemeData(
                accentColor: Color.fromRGBO(0, 0, 0, 0.4),
              ),
              child: FloatingActionButton(
                child: Icon(
                  Icons.camera_alt,
                  size: 36.0,
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                ),
                onPressed: () {
                  _captureImage();
                },
              ),
            ),
          )
        ],
      );
  }
}
