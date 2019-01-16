import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_chat/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:firestore_ui/animated_firestore_list.dart';

class FirestoreListAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FirestoreAnimatedList(
        query: Firestore.instance.collection('chat_messages').
          orderBy("timestamp", descending: true).snapshots(),
        reverse: true,
        itemBuilder: (
            BuildContext context,
            DocumentSnapshot snapshot,
            Animation<double> animation,
            int index,
            ) {
          return SizeTransition(
            child: ChatMessage(snapshot: snapshot,),
            sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeOut),
          );
        },
      ),
    );
  }
}
