import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {

  final GoogleSignInAccount currentUser;

  const TextComposer({Key key, this.currentUser}) : super(key: key);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> with
  TickerProviderStateMixin {

  final TextEditingController _textEditingController = TextEditingController();
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _isComposing = false;
    });
    _sendMessage(text: text);
  }

  void _sendMessage({String text, String photoUrl}) {
    setState(() {
      Firestore.instance.collection('chat_messages').document()
          .setData({
        'name': widget.currentUser.displayName,
        'avatarUrl': widget.currentUser.photoUrl,
        'photoUrl': photoUrl,
        'text': text,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.photo),
                onPressed: () async {
                  File imageFile = await ImagePicker.pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 400.0,
                    maxHeight: 300.0,
                  );
                  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
                  StorageReference ref = FirebaseStorage.instance.ref().child('image_${timestamp()}.jpg');
                  StorageUploadTask uploadTask = ref.putFile(imageFile);
                  var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
                  _sendMessage(photoUrl: downloadUrl.toString());
                },
              ),
              Flexible(
                child: TextField(
                  onSubmitted: _handleSubmitted,
                  controller: _textEditingController,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  decoration: InputDecoration.collapsed(hintText: 'Send a message'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _isComposing ? () => _handleSubmitted(_textEditingController.text)
                  : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
