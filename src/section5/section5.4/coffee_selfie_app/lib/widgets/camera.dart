import 'dart:async';

import 'package:coffee_selfie_app/api/storage.dart';
import 'package:coffee_selfie_app/redux/actions/actions.dart';
import 'package:coffee_selfie_app/redux/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Camera extends StatefulWidget {

  const Camera({Key key}) : super(key: key);

  @override
  CameraState createState() => CameraState();
}

class CameraState extends State<Camera> {

  List<CameraDescription> cameras;
  static CameraController controller;
  bool isCameraInitialized = false;

  void _initializeController() {
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controller.initialize().then((_) {
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
    controller.dispose();
    super.dispose();
  }

  static Future<String> captureImage() async {
    var path = await Storage.getFilePath();
    var completer = Completer<String>();
    if(!controller.value.isTakingPicture)
      try {
        await controller.takePicture(path);
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
            scale: controller.value.aspectRatio / deviceRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),
          Center(
            child: Theme(
              data: ThemeData(
                accentColor: Color.fromRGBO(0, 0, 0, 0.4),
              ),
              child: StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(CaptureImageAction());
                },
                builder: (context, callback) {
                  return
                    FloatingActionButton(
                      child: Icon(
                        Icons.camera_alt,
                        size: 36.0,
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                      ),
                      onPressed: callback,
                    );
                },
              ),
            ),
          )
        ],
      );
  }
}
