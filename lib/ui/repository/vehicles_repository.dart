import 'package:mobile_app/repository/I_vehicles_repository.dart';
import 'package:mobile_app/services/store.dart';
import 'package:mobile_app/ui/models/vehicles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VehiclesRepository implements IVehiclesRepository {
  List<Vehicles> _listVehicles;
  bool _listVehiclesIsValid;

  @override
  Future<void> saveAllVehicles(
      Map<String, String> mapHeadresAutorization) async {
    final urlVehicle = 'https://rastrear.lftecnologia.com.br/api/vehicles/';
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

  String get getStringAllVehicles {
    String prints = _listVehicles.map((e) => jsonEncode(e)).toString();
    return prints;
  }

  List<Vehicles> get listAllVehicles {
    return _listVehicles;
  }

  @override
  Future<dynamic> getUserAuthToken(String username, String password) async {
    var urlToken = 'https://rastrear.lftecnologia.com.br/api/auth/token/';

    var response = await http
        .post(urlToken, body: {'username': username, 'password': password});
    return response;
  }
}
