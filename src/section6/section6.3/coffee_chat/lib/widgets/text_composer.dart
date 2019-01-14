import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  void _sendMessage({String text}) {
    setState(() {
      Firestore.instance.collection('chat_messages').document()
          .setData({
        'name': widget.currentUser.displayName,
        'avatarUrl': widget.currentUser.photoUrl,
        'photoUrl': null,
        'text': text,
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
