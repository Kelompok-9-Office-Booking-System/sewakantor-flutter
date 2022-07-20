import 'package:dio/dio.dart';
import 'package:sewakantor_flutter/models/space_model.dart';

class SpaceAPI {
  static Future<List> getSpacesFromAPI({
    required String name,
    required String token,
  }) async {
    Response responseCoba = await Dio().get(
      'https://sk-api.mbaharip.me/api/v1/customer/spaces',
      queryParameters: {
        'name': name,
      },
      options: Options(
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );

    // print(responseCoba.data);
    if (responseCoba.statusCode == 200) {
      List<dynamic> events = responseCoba.data!["data"].map((e) {
        return SpaceModel.fromJson(e) as SpaceModel;
      }).toList();

      print('zzzzzzzzzzz');

      List<SpaceModel> realakun = [];
      for (var element in events) {
        realakun.add(SpaceModel.fromDynamic(element));
      }

      print(realakun[0].types!.length);

      return realakun;
    }

    throw Exception();
  }

  static Future<List> getEventTrending({
    required String nama,
  }) async {
    Response responseCoba = await Dio().get(
      'http://10.0.2.2:8000/api/events/trending',
      queryParameters: {
        'nama': nama,
      },
    );

    if (responseCoba.statusCode == 200) {
      List<dynamic> events = responseCoba.data!["events"].map((e) {
        return SpaceModel.fromJson(e) as SpaceModel;
      }).toList();

      List<SpaceModel> realakun = [];
      for (var element in events) {
        realakun.add(SpaceModel.fromDynamic(element));
      }

      return realakun;
    }

    throw Exception();
  }
}
