import 'package:cafe_scanner_app/bloc/qr_bloc.dart';
import 'package:cafe_scanner_app/bloc/qr_state.dart';
import 'package:cafe_scanner_app/widget/ProductForm.dart';
import 'package:cafe_scanner_app/widget/QrCodeImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final QrBloc _qrBloc = QrBloc();

  Widget _createPage() {
    return BlocBuilder(
      bloc: _qrBloc,
      builder: (BuildContext context, QrState state) {
        return Column(
          children: <Widget>[
            ProductForm(
              category: state.formButton,
            ),
            QrCodeImage(
              product: state.serializedProduct,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QrBloc>(
      bloc: _qrBloc,
      child: _createPage(),
    );
  }
}
