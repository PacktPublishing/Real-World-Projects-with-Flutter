import 'package:http/http.dart' show Client;
import 'package:my_weather_app/model/WeatherData.dart';

class MapApi {

  // Add your http://openweathermap.org api key here
  static const _apiKey = '011b68ffa175baa0ce29a8a87e6ffa54';
  static const _endpoint = 'http://api.openweathermap.org/data/2.5';
  double lat, lon;
  Client client = Client();

  static MapApi _instance;
  static MapApi getInstance() => _instance ??= MapApi();

  String _apiCall({double lat, double lon}) {
    return _endpoint + "/weather?lat=" + lat.toString() + "&lon=" + lon.toString() +
        "&APPID=" + _apiKey + "&units=metric";
  }

  getWeather({double lat, double lon}) async {
    var response = await client.get(
      Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
      headers: {
        'Accept': 'application/json'
      }
    );
    return WeatherData.deserialize(response.body);
  }

}