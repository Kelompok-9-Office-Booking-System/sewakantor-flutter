class FacilityModel {
  late final String? name;
  late final String? icon;

  FacilityModel({
    required this.name,
    required this.icon,
  });

  FacilityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
    };
  }
}
