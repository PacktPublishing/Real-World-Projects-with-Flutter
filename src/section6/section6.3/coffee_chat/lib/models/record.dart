class Record {

  final String name;
  final String avatarUrl;
  final String photoUrl;
  final String text;

  Record.fromMap(Map<String, dynamic> map) :
      name = map['name'],
      avatarUrl = map['avatarUrl'],
      photoUrl = map['photoUrl'],
      text = map['text'];
}