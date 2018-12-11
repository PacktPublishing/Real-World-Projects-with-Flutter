import 'package:cafe_scanner_app/model/Product.dart';

abstract class CameraEvent{}

class CameraCapture extends CameraEvent {

  final Product product;

  CameraCapture({this.product});
  
}