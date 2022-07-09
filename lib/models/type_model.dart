class TypeModel {
  late final String? name;
  late final int? count;

  TypeModel({
    required this.name,
    required this.count,
  });

  TypeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'count': count,
    };
  }
}
