import 'package:my_weather_app/model/LocationData.dart';
import 'package:test_api/test_api.dart';

main() {

  test('Test Location Data', () {
    final double lat = 51.15;
    final double lon = -0.13;

    Map<String, double> testData = {
      'latitude': lat,
      'longitude': lon,
    };

    var locationData = LocationData.locationItems(testData);
    expect(locationData.lat, equals(lat));
    expect(locationData.lon, equals(lon));
  });
}