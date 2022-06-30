// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sewakantor_flutter/models/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      String base_url = 'http://54.211.120.43/api/v1/customer/auth/login';
      print(base_url);
      var response = await Dio().post(
        'http://54.211.120.43/api/v1/customer/auth/login',
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          headers: {"Accept": "application/json"},
        ),
      );
      print(response.data);

      if (response.statusCode == 200) {
        final user = UserModel.fromJson(response.data);
        return user;
      }
      throw Exception();
    } catch (e) {
      print('masuk Error service');
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      String base_url = 'http://54.211.120.43/api/v1/customer/auth/register';
      print(base_url);

      var response =
          await Dio().post('http://54.211.120.43/api/v1/customer/auth/register',
              data: {
                "email": email,
                "password": password,
                "firstName": firstName,
                "lastName": lastName,
              },
              options: Options(
                headers: {"Accept": "application/json"},
              ));

      if (response.statusCode == 200) {
        final user = UserModel.fromJson(response.data);
        return user;
      }
      throw Exception();
    } catch (e) {
      print('masuk Error service');
      throw e;
    }
  }

  Future<void> signOut({required String token}) async {
    try {
      print("masuk ke service dan in tokenya $token");
      // var response = await Dio().get(
      //   'http://10.0.2.2:8000/api/logout',
      //   options: Options(
      //     headers: {
      //       "Accept": "application/json",
      //       "Authorization": "Bearer $token"
      //     },
      //   ),
      // );
    } catch (e) {
      throw e;
    }
  }

  // Future<void> changePassword({
  //   required String password,
  //   required String token,
  // }) async {
  //   try {
  //     var response =
  //         await Dio().put('http://10.0.2.2:8000/api/users/change-password',
  //             data: {"password": password},
  //             options: Options(
  //               headers: {
  //                 "Accept": "application/json",
  //                 "Authorization": "Bearer $token"
  //               },
  //             ));
  //     print(response.data);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<void> signOut() async {
  //   try {
  //     await _firebaseAuth.signOut();
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<UserModel> updateUser({
  //   required String fullName,
  //   required int phoneNumber,
  // }) async {
  //   try {
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     print(currentUser);

  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var user = prefs.getString('userSaved');

  //     var getUser = UserModel.fromJson(json.decode(user!));

  //     UserModel userUpdated = UserModel(
  //       uid: getUser.uid,
  //       email: getUser.email,
  //       fullName: fullName,
  //       role: getUser.role,
  //       phoneNumber: phoneNumber,
  //     );

  //     // note : melakukan set user (menyimpan data user pada firestore)
  //     await UserService().setUser(userUpdated);

  //     return userUpdated;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<UserModel> getUserByToken({required String token}) async {
  //   try {
  //     // Note : Untuk Register pada Firebase Auth
  //     // * (belum tersimpan ke firestore)
  //     var response = await Dio().get('http://10.0.2.2:8000/api/my-profile',
  //         options: Options(
  //           headers: {
  //             "Accept": "application/json",
  //             "Authorization": "Bearer $token"
  //           },
  //         ));

  //     final user = UserModel.createUser(response.data);
  //     return user;
  //   } catch (e) {
  //     print('masuk Error service');
  //     throw e;
  //   }
  // }

  // Future<UserModel> updateUser({
  //   required String fullName,
  //   required String phoneNumber,
  //   required String token,
  // }) async {
  //   try {
  //     // Note : Untuk Register pada Firebase Auth
  //     // * (belum tersimpan ke firestore)
  //     var response =
  //         await Dio().put('http://10.0.2.2:8000/api/update-user-active',
  //             data: {
  //               "nama": fullName,
  //               "no_hp": phoneNumber,
  //             },
  //             options: Options(
  //               headers: {
  //                 "Accept": "application/json",
  //                 "Authorization": "Bearer ${token}"
  //               },
  //             ));
  //     print("lalala hore ${response.data["user"]}");
  //     final user = UserModel.createUser(response.data);
  //     return user;
  //   } catch (e) {
  //     print('masuk Error service');
  //     throw e;
  //   }
  // }
}
