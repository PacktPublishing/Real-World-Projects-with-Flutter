import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {

  final String category;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  ProductForm({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Text('Product $category'),
          )
        ],
      ),
    );
  }
}

