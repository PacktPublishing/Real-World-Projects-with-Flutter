import 'package:cloud_firestore/cloud_firestore.dart';

class Record {

  final String name;
  final String avatarUrl;
  final String photoUrl;
  final String text;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference}) :
      name = map['name'],
      avatarUrl = map['avatarUrl'],
      photoUrl = map['photoUrl'],
      text = map['text'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
    : this.fromMap(snapshot.data, reference: snapshot.reference);
}