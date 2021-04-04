import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/vehicles.dart';
import '../../repository/I_vehicles_repository.dart';

class LFVehiclesRepository implements IVehiclesRepository {
  List<Vehicles> _listVehicles;
  bool _listVehiclesIsValid;

  @override
  Future<dynamic> getUserAuthToken(String username, String password) async {
    const String urlToken =
        const String.fromEnvironment("LF_URLTOKEN", defaultValue: "http");

    var response = await http
        .post(urlToken, body: {'username': username, 'password': password});
    return response;
  }

  @override
  Future<void> getAllVehicles(
      Map<String, String> mapHeadresAutorization) async {
    const String urlVehicle = const String.fromEnvironment("LF_URLVEHICLE");
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
