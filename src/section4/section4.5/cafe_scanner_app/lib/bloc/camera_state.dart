import 'package:cafe_scanner_app/model/Product.dart';

class CameraState {

  final Product product;

  CameraState({this.product});

  factory CameraState.initial() {
    return CameraState(
      product: Product(0, 'No Product', 0.0),
    );
  }

  factory CameraState.display(Product product) {
    return CameraState(
      product: product,
    );
  }
}