import './rest_service.dart';
import '../models/places.dart';

class PlaceDataService {
  static final PlaceDataService _instance = PlaceDataService._constructor();
  factory PlaceDataService() {
    return _instance;
  }

  PlaceDataService._constructor();
  final rest = RestService();

  Future<List<Place>> getAllPlaces() async {
    final listJson = await rest.get('places');

    return (listJson as List)
        .map((itemJson) => Place.fromJson(itemJson))
        .toList();
  }

  Future<List<Place>> getAllFavorite() async {
    final listJson = await rest.get('places');
    return (listJson as List)
        .map((itemJson) => Place.fromJson(itemJson))
        .where((element) => element.favorite == true)
        .toList();
  }

  Future<Place> addPlace({Place place}) async {
    final json = await rest.post('places', data: place.toJson());
    return Place.fromJson(json);
  }

  Future<Place> updateFavorite({String id, bool fav}) async {
    final json = await rest.patch('places/$id', data: {'favorite': !fav});
    return Place.fromJson(json);
  }
}
