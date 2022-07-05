// ignore_for_file: prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:sewakantor_flutter/models/space_model.dart';
import 'package:sewakantor_flutter/services/api/space_api.dart';

enum SpaceState {
  none,
  loading,
  error,
}

class SpaceProvider with ChangeNotifier {
  // note : Start Code Event State

  SpaceState _spaceState = SpaceState.none;
  SpaceState get spaceState => _spaceState;

  changeState(SpaceState spaceState) {
    _spaceState = spaceState;
    notifyListeners();
  }

  // note : End Code Event State

  List<SpaceModel> _spaces = [];
  List<SpaceModel> get spaces => _spaces;

  set spaces(List<SpaceModel> spaces) {
    _spaces = spaces;
    notifyListeners();
  }

  Future<void> getSpacesFromAPI({
    required String name,
    required String token,
  }) async {
    changeState(SpaceState.loading);
    try {
      print(name);
      List<SpaceModel> spaces = await SpaceAPI.getSpacesFromAPI(
        name: name,
        token: token,
      ) as List<SpaceModel>;

      _spaces = spaces;

      changeState(SpaceState.none);
    } catch (e) {
      print(e);
      changeState(SpaceState.error);
    }
    notifyListeners();
  }

  // Future<void> getEventTrending({
  //   required String nama,
  // }) async {
  //   changeState(SpaceState.loading);
  //   try {
  //     List<SpaceModel> spaces =
  //         await EventAPI.getEventTrending(nama: nama) as List<SpaceModel>;

  //     _spaces = spaces;

  //     changeState(SpaceState.none);
  //   } catch (e) {
  //     print(e);
  //     changeState(SpaceState.error);
  //   }
  //   notifyListeners();
  // }
}
