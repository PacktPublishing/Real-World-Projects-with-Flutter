import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FirebaseQrDetector {

  final File imageFile;

  FirebaseQrDetector(this.imageFile);

  void detectQrCode() async {
    final visionImage = FirebaseVisionImage.fromFile(imageFile);
    BarcodeDetectorOptions options = BarcodeDetectorOptions(
      barcodeFormats: BarcodeFormat.qrCode,
    );
    final detector = FirebaseVision.instance.barcodeDetector(options);
    final List<Barcode> barcodes = await detector.detectInImage(visionImage);
    _extractProduct(barcodes);
  }

  _extractProduct(List<Barcode> barcodes) {
    for(Barcode barcode in barcodes) {
      final String rawValue = barcode.rawValue;
    }
  }
}