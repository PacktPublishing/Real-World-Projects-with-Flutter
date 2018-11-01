import 'package:location/location.dart';
import 'package:my_coffee_app/model/MyLocationData.dart';
import 'package:flutter/services.dart';

class MyLocationApi {

  Location _location = Location();
  String error;

  static MyLocationApi _instance;
  static MyLocationApi getInstance() => _instance ??= MyLocationApi();

  Future<MyLocationData> getLocation() async {

    Map<String, double> location;

    try {
      location = await _location.getLocation();
      error = null;
    } on PlatformException catch (e) {
      if(e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask user to enable it from the app settings';
      }
      location = null;
    }
    return MyLocationData.locationItems(location);
  }
}