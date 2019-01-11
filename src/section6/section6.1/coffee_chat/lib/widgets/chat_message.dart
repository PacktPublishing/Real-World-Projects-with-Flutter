import 'package:coffee_chat/models/record.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final Map<String, dynamic> snapshot;

  const ChatMessage({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final record = Record.fromMap(snapshot);

    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(child: Text(record.name[0]),),
          Text(record.text),
        ],
      ),
    );
  }
}
