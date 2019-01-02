import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareImage extends StatelessWidget {

  final String imagePath;

  const ShareImage({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              File(imagePath).delete();
              Navigator.popAndPushNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.shareFile(File(imagePath));
            },
          )
        ],
      ),
      body: Hero(
        tag: '$imagePath',
        child: Image.asset(
          imagePath,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
