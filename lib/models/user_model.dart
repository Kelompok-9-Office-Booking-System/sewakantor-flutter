class UserModel {
  late int? uid;
  late String? email;
  late String? firstName;
  late String? lastName;
  late int? roleId;
  late String? role;
  late String? token;
  // Optional
  String? phoneNumber;
  String? companyName;
  String? companyEmail;
  String? country;
  String? zipCode;
  String? address;

  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roleId,
    required this.role,
    required this.token,
    // Optional
    this.phoneNumber,
    this.companyName,
    this.companyEmail,
    this.country,
    this.zipCode,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'roleId': roleId,
        'role': role,
        'tokenType': 'Bearer',
        'token': token,
      },
    };
  }

  Map<String, dynamic> toJsonLocal() {
    return {
      'data': {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'roleId': roleId,
        'role': role,
        'tokenType': 'Bearer',
        'token': token,
        'phoneNumber': phoneNumber,
        'companyName': companyName,
        'companyEmail': companyEmail,
        'country': country,
        'zipCode': zipCode,
        'address': address,
      },
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['data']['email'];
    firstName = json['data']['firstName'];
    lastName = json['data']['lastName'];
    roleId = json['data']['roleId'];
    role = json['data']['role'];
    token = json['data']['token'];
  }

  UserModel.fromJsonLocal(Map<String, dynamic> json) {
    email = json['data']['email'];
    firstName = json['data']['firstName'];
    lastName = json['data']['lastName'];
    roleId = json['data']['roleId'];
    role = json['data']['role'];
    token = json['data']['token'];
    phoneNumber = json['data']['phoneNumber'];
    companyName = json['data']['companyName'];
    companyEmail = json['data']['companyEmail'];
    country = json['data']['country'];
    zipCode = json['data']['zipCode'];
    address = json['data']['address'];
  }
}
