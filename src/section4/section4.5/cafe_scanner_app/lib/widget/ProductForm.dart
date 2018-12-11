import 'package:cafe_scanner_app/bloc/qr_bloc.dart';
import 'package:cafe_scanner_app/bloc/qr_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductForm extends StatelessWidget {

  final String category;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  ProductForm({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final QrBloc qrBloc = BlocProvider.of<QrBloc>(context);

    return Form(
      key: _formKey,
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextFormField(
              controller: _textController,
              validator: (value) {
                if(value.isEmpty)
                  return 'Enter the product $category';
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              qrBloc.dispatch(FormQrEvent(
                productItem: _textController.text,
              ));
            },
            child: Text('Product $category'),
          )
        ],
      ),
    );
  }
}

