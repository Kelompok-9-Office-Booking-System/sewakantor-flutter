import 'package:sewakantor_flutter/models/facility_model.dart';
import 'package:sewakantor_flutter/models/nearby_place_model.dart';
import 'package:sewakantor_flutter/models/type_model.dart';

class SpaceModel {
  late final int? id;
  late final String? name;
  late final String? thumbnail;
  late final String? description;
  late final String? address;
  late final int? unit;
  late final double? rating;
  late final int? price;
  late final List<TypeModel>? types;
  late final List<FacilityModel>? facilities;
  late final List<NearbyPlaceModel>? nearbyPlaces;

  SpaceModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description,
    required this.address,
    required this.unit,
    required this.rating,
    required this.price,
    required this.types,
    required this.facilities,
    required this.nearbyPlaces,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
      'description': description,
      'address': address,
      'unit': unit,
      'rating': rating,
      'price': price,
      'types': types?.map((type) => type.toJson()).toList(),
      'facilities': facilities?.map((facility) => facility.toJson()).toList(),
      'nearbyPlaces': nearbyPlaces?.map((place) => place.toJson()).toList(),
    };
  }

  SpaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    address = json['address'];
    unit = json['unit'];
    rating = json['rating'];
    price = json['price'];
    types = json['types']
        .map<TypeModel>((type) => TypeModel.fromJson(type))
        .toList();
    facilities = json['facilities']
        .map<FacilityModel>((facility) => FacilityModel.fromJson(facility))
        .toList();
    nearbyPlaces = json['nearbyPlaces']
        .map<NearbyPlaceModel>((place) => NearbyPlaceModel.fromJson(place))
        .toList();
  }

  SpaceModel.fromDynamic(dynamic json) {
    id = json.id;
    name = json.name;
    thumbnail = json.thumbnail;
    description = json.description;
    address = json.address;
    unit = json.unit;
    rating = json.rating;
    price = json.price;
    types = json.types;
    facilities = json.facilities;
    nearbyPlaces = json.nearbyPlaces;
  }
}
