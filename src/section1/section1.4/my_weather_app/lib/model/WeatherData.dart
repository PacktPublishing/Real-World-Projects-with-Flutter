import 'dart:convert';

class WeatherData {
  final String name;
  final double temp;
  final String main;
  final String icon;

  WeatherData({this.name, this.temp, this.main, this.icon});

  static WeatherData deserialize(String json) {
    JsonDecoder decoder = JsonDecoder();
    var map = decoder.convert(json);

    String name = map['name'];
    double temp = map['main']['temp'].toDouble();
    String main = map['weather'][0]['main'];
    String icon = map['weather'][0]['icon'];

    return WeatherData(name: name, temp: temp, main: main, icon: icon);
  }
}