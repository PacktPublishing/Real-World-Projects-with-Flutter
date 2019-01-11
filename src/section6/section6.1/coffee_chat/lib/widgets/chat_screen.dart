import 'package:coffee_chat/widgets/chat_list.dart';
import 'package:coffee_chat/widgets/text_composer.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final List<Map<String, dynamic>> _dummySnapshot = [];

  void _sendMessageCallback(String text) {
    setState(() {
      _dummySnapshot.insert(0, {
        'name': 'Nigel',
        'avatarUrl': '',
        'photoUrl': '',
        'text': text,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Coffee Chat'),
      ),
      body: Column(
        children: <Widget>[
          ChatList(snapshots: _dummySnapshot,),
          Divider(height: 1.0,),
          TextComposer(sendCallback: _sendMessageCallback,),
        ],
      ),
    );
  }
}
