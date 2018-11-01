import 'package:google_maps_webservice/places.dart';
import 'package:my_coffee_app/config/Config.dart';
import 'package:my_coffee_app/model/CoffeeShopsData.dart';
import 'package:my_coffee_app/model/MyLocationData.dart';

class CoffeeShopsApi {

  static CoffeeShopsApi _instance;
  static CoffeeShopsApi getInstance() => _instance ??= CoffeeShopsApi();

  Future<CoffeeShopsData> getCoffeeShops(MyLocationData location) async {

    final googlePlaces = GoogleMapsPlaces(apiKey);
    final response = await googlePlaces.searchNearbyWithRadius(
        Location(location.lat, location.lon),
        2000, type: 'Cafe', keyword: 'coffee');
    return CoffeeShopsData.convertToShops(response.results);
  }
}