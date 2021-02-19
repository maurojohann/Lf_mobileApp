import 'package:mobile_app/repository/I_vehicles_repository.dart';
import 'package:mobile_app/ui/models/vehicles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class VehiclesRepository implements IVehiclesRepository {
  List<Vehicles> _listVehicles;
  @override
  Future<void> saveAllVehicles(
      Map<String, String> mapHeadresAutorization) async {
    final urlVehicle = 'https://rastrear.lftecnologia.com.br/api/vehicles/';
    var responseGet =
        await http.get(urlVehicle, headers: mapHeadresAutorization);
    var responsedGetBody = convert.jsonDecode(responseGet.body) as List;
    _listVehicles = responsedGetBody.map((e) => Vehicles.fromJson(e)).toList();
    return Future.value();
  }

  String get getStringAllVehicles {
    String prints = _listVehicles.map((e) => convert.jsonEncode(e)).toString();
    return prints;
  }

  List<Vehicles> get listAllVehicles {
    return _listVehicles;
  }
}
