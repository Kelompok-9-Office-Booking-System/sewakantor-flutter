class SpaceModel {
  late final int? id;
  late final String? name;
  late final String? thumbnail;
  late final String? description;
  late final String? address;
  late final int? unit;
  late final double? rating;
  late final int? price;

  SpaceModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description,
    required this.address,
    required this.unit,
    required this.rating,
    required this.price,
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
  }
}
