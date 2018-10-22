class LocationData {
  final double lat;
  final double lon;

  LocationData(this.lat, this.lon);

  static LocationData locationItems(Map<String, double> location) {
    double lat = location['latitude'];
    double lon = location['longitude'];

    return LocationData(lat, lon);
  }
}