import 'dart:io';

import 'package:cafe_scanner_app/api/FireStorage.dart';
import 'package:cafe_scanner_app/api/FirebaseQrDetector.dart';
import 'package:cafe_scanner_app/model/Product.dart';
import 'package:cafe_scanner_app/widget/ScannedProduct.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  List<CameraDescription> cameras;
  CameraController controller;
  bool isCameraInitialized = false;
  Product _product;

  void _productCallback(product) {
    if(product != null)
      setState(() {
        _product = product;
      });
  }

  void _initializeController() {
    controller = CameraController(cameras[0], ResolutionPreset.medium);
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

  Future<File> _cropImage(File imageFile) async {
    return await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 250,
      maxHeight: 250,
    );
  }

  @override
  Widget build(BuildContext context) {
    if(!isCameraInitialized)
      return Container();
    else
      return ListView(
        children: <Widget>[
          Column(
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
                        child: CameraPreview(controller),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.camera_alt,
                  size: 50,
                ), onPressed: () {
                saveQrCode().then((filePath) {
                  _cropImage(File(filePath)).then((croppedImage) {
                    FirebaseQrDetector(croppedImage, _productCallback).detectQrCode();
                  });
                });
              },
              )
            ],
          ),
          ScannedProduct(
            product: _product,
          )
        ],
      );
  }
}
