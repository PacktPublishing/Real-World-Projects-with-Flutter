import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_weather_app/api/MapApi.dart';
import 'package:http/testing.dart';
import 'package:test_api/test_api.dart';

main() {

  test('MapApi getWeather method', () async{
    final double lat = 35.57;
    final double lon = 136.77;

    final mapJson = {
      "coord":{"lon":136.77,"lat":35.57},
      "weather":[{"id":803,"main":"Clouds","description":"broken clouds","icon":"04d"}],
      "base":"stations",
      "main":{"temp":18,"pressure":1022,"humidity":55,"temp_min":18,"temp_max":18},
      "visibility":10000,
      "wind":{"speed":1.5,"deg":50},
      "clouds":{"all":75},
      "dt":1539389400,
      "sys":{"type":1,"id":7565,"message":0.0047,"country":"JP","sunrise":1539377829,"sunset":1539418848},
      "id":1857062,
      "name":"Mino","cod":200};

    final mapApi = MapApi.getInstance();
    
    mapApi.client = MockClient((request) async {
      return Response(json.encode(mapJson), 200);
    }); 
    
    final weatherItem = await mapApi.getWeather(lat: lat, lon: lon);

    expect(weatherItem.name, 'Mino');
    expect(weatherItem.temp, 18);
  });
}