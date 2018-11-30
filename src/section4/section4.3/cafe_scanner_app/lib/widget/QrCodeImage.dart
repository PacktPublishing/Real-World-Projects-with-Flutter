import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeImage extends StatelessWidget {

  final String product;

  const QrCodeImage({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 60,
        ),
        child: QrImage(
          data: product,
          size: 300,
        ),
      ),
    );
  }
}
