import 'package:coffee_selfie_app/redux/models/app_state.dart';
import 'package:coffee_selfie_app/widgets/camera.dart';
import 'package:coffee_selfie_app/widgets/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {

  final void Function() onInit;

  const Home({Key key, @required this.onInit}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Camera(),
        Align(
          alignment: Alignment(0, 0.95),
          child: Container(
            height: 100.0,
            child: StoreConnector<AppState, List<String>>(
              converter: (store) => store.state.imagePaths,
              builder: (context, imagePaths) {
                return Gallery(
                  paths: imagePaths,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
