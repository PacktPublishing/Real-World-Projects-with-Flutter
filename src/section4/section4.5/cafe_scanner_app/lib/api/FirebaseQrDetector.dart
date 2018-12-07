import 'dart:convert';
import 'dart:io';
import 'package:cafe_scanner_app/model/Product.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FirebaseQrDetector {

  final File imageFile;
  final Function(Product) productCallback;

  FirebaseQrDetector(this.imageFile, this.productCallback);

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
      final Map productMap = json.decode(rawValue);
      final Product product = Product.fromJson(productMap);
      productCallback(product);
    }
  }
}