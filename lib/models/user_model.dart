class UserModel {
  late final int? uid;
  late final String? email;
  late final String? firstName;
  late final String? lastName;
  late final int? roleId;
  late final String? role;
  late final String? token;

  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roleId,
    required this.role,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'username': email,
        'roleId': roleId,
        'role': role,
        'tokenType': 'Bearer',
        'token': token,
      },
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['data']['username'];
    roleId = json['data']['roleId'];
    role = json['data']['role'];
    token = json['data']['token'];
  }
}
