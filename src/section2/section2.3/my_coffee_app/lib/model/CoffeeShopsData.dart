import 'package:google_maps_webservice/places.dart';

class CoffeeShopsData {

  List<Shop> shopList;

  CoffeeShopsData(this.shopList);

  static convertToShops(List<PlacesSearchResult> googlePlaces) {

    List<Shop> shops = [];

    googlePlaces.forEach((shop) {
      if(shop.photos != null)
        shops.add(Shop.shopDetails(shop));
    });
    return CoffeeShopsData(shops);
  }
}

class Shop {

  final String id;
  final String name;
  final double lat;
  final double lon;
  final String photoRef;

  Shop(this.id, this.name, this.lat, this.lon, this.photoRef);

  static shopDetails(PlacesSearchResult places) {
    String id = places.id;
    String name = places.name;
    double lat = places.geometry.location.lat;
    double lon = places.geometry.location.lng;
    String photoRef = places.photos[0].photoReference;

    return Shop(id, name, lat, lon, photoRef);
  }
}

