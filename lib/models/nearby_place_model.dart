class NearbyPlaceModel {
  late final String? name;
  late final String? distance;

  NearbyPlaceModel({
    required this.name,
    required this.distance,
  });

  NearbyPlaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'distance': distance,
    };
  }
}
