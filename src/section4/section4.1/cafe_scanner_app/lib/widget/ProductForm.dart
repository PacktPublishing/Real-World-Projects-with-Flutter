import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  
  final String category;

  const ProductForm({Key key, this.category}) : super(key: key);
  
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  
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
                  return 'Enter the product ${widget.category}';
              },
            ),
          ),
          RaisedButton(
            child: Text('Product ${widget.category}'),
          )
        ],
      ),
    );
  }
}
