import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/vehicles.dart';
import '../../repository/I_vehicles_repository.dart';

class LFVehiclesRepository implements IVehiclesRepository {
  List<Vehicles> _listVehicles;
  bool _listVehiclesIsValid;

  @override
  Future<dynamic> getUserAuthToken(String username, String password) async {
    String urlToken = env['LFToken'];

    var response = await http
        .post(urlToken, body: {'username': username, 'password': password});
    return response;
  }

  @override
  Future<void> getAllVehicles(
      Map<String, String> mapHeadresAutorization) async {
    String urlVehicle = env['LFVehicle'];
    var responseGet =
        await http.get(urlVehicle, headers: mapHeadresAutorization);

    var responsedGetBody =
        json.decode(utf8.decode(responseGet.bodyBytes)) as List;
    _listVehicles = responsedGetBody.map((e) => Vehicles.fromJson(e)).toList();
    _listVehiclesIsValid = true;
    return Future.value();
  }

  bool get getVehiclesIsValid {
    return _listVehiclesIsValid;
  }

  List<Vehicles> get listAllVehicles {
    return [..._listVehicles];
  }
}
