import 'package:coffee_selfie_app/widgets/share_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Thumbnail extends StatelessWidget {

  final String imagePath;

  const Thumbnail({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          timeDilation = 2.5;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return ShareImage(
                  imagePath: imagePath,
                );
              }),
          );
        },
        child: Hero(
          tag: '$imagePath',
          child: Image.asset(
            imagePath,
            height: 75.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
