import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Storage {

  static Future<String> getDirectoryPath() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/coffee_selfie';
    await Directory(dirPath).create(recursive: true);
    return '$dirPath';
  }

  static Future<String> getFilePath() async {
    String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
    final String dirPath = await getDirectoryPath();
    return '$dirPath/${timestamp()}.jpg';
  }

  static Future<List<String>> getFilePaths() async {
    final List<String> paths = [];
    var directory = Directory(await getDirectoryPath());
    var completer = Completer<List<String>>();
    var lister = directory.list(recursive: false);
    lister.listen(
        (file) {
          if(file is File)
            paths.insert(0, file.path);
        },
      onDone: () => completer.complete(paths)
    );
    return completer.future;
  }
}