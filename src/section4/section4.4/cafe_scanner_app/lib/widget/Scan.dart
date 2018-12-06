import 'package:cafe_scanner_app/api/FireStorage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  List<CameraDescription> cameras;
  CameraController controller;
  bool isCameraInitialized = false;
  String _imagePath;

  void _initializeController() {
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if(!mounted)
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

  Future<String> saveQrCode() async {
    final String filePath = await FireStorage.getFilePath();
    if(controller.value.isTakingPicture)
      return null;
    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      throw Exception('Failed to capture image: $e');
    }
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    if(!isCameraInitialized)
      return Container();

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
                  height: 250/controller.value.aspectRatio,
                  child: CameraPreview(
                    controller
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
