import 'package:coffee_chat/widgets/chat_list.dart';
import 'package:coffee_chat/widgets/firestore_message_stream.dart';
import 'package:coffee_chat/widgets/text_composer.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum MenuItem {signout}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final List<Map<String, dynamic>> _dummySnapshot = [];
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount _currentUser;
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser _firebaseUser;

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
        _firebaseAuth.currentUser().then((firebaseUser) {
          if(_firebaseUser == null)
            _getFirebaseUser().then((firebaseUser) {
              setState(() {
                _firebaseUser = firebaseUser;
              });
            });
          else
            setState(() {
              _firebaseUser = firebaseUser;
            });
        });
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<FirebaseUser> _getFirebaseUser() async {
    var credentials = await _googleSignIn.currentUser.authentication;
    return await _firebaseAuth.signInWithGoogle(
        idToken: credentials.idToken,
        accessToken: credentials.accessToken,
    );
  }

  Future<Null> _handleSignin() async {
    var user = _googleSignIn.currentUser;
    if(user == null)
      user = await _googleSignIn.signInSilently();
    if(user == null)
      await _googleSignIn.signIn();
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.disconnect();
  }

  void _sendMessageCallback(String text) {
    setState(() {
      _dummySnapshot.insert(0, {
        'name': _googleSignIn.currentUser.displayName,
        'avatarUrl': _googleSignIn.currentUser.photoUrl,
        'photoUrl': '',
        'text': text,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_firebaseUser == null)
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  _handleSignin();
                },
              ),
            ],
          ),
        ),
      );
    else
      return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text('Coffee Chat'),
          actions: <Widget>[
            PopupMenuButton<MenuItem>(
              onSelected: (MenuItem menuItem) {
                setState(() {
                  _handleSignOut();
                });
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<MenuItem>>[
                PopupMenuItem<MenuItem>(
                  value: MenuItem.signout,
                  child: Text('Google Signout'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            FirestoreMessageStream(),
            Divider(height: 1.0,),
            TextComposer(currentUser: _currentUser,),
          ],
        ),
      );
  }
}
