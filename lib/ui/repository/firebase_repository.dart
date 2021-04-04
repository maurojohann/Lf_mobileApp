import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/vehicles.dart';
import 'package:mobile_app/repository/I_vehicles_repository.dart';

class FireBaseRepository implements IVehiclesRepository {
  List<Vehicles> _listVehicles;
  bool _listVehiclesIsValid;

  @override
  Future<dynamic> getUserAuthToken(String username, String password) {
    const String api_key =
        const String.fromEnvironment("LF_FBASE_KEY", defaultValue: "Key");
    const String urlToken =
        const String.fromEnvironment("LF_FBASE_SIGNIN", defaultValue: "http") +
            api_key;

    var response = http.post(urlToken, body: {
      "email": username,
      "password": password,
      "returnSecureToken": "true"
    });

    return response;
  }

  @override
  Future<void> getAllVehicles(
      Map<String, String> mapHeadresAutorization) async {
    String _urlVehicle = const String.fromEnvironment("LF_FBASE_URLVEHICLE") +
        mapHeadresAutorization["Authorization"];

    var responseGet = await http.get(_urlVehicle);

    if (responseGet.statusCode == 200) {
      var responsedGetBody = json.decode(responseGet.body) as List;
      _listVehicles =
          responsedGetBody.map((e) => Vehicles.fromJson(e)).toList();
      _listVehiclesIsValid = true;
    } else {
      _listVehiclesIsValid = false;
      _listVehicles = [];
    }

    return Future.value();
  }

  bool get getVehiclesIsValid {
    return _listVehiclesIsValid;
  }

  List<Vehicles> get listAllVehicles {
    return [..._listVehicles];
  }
}
