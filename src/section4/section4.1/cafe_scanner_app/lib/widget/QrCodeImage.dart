import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60,
      ),
      child: QrImage(
        data: 'hello',
        size: 300,
      ),
    );
  }
}
