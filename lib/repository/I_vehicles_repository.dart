import 'package:mobile_app/ui/models/vehicles.dart';

abstract class IVehiclesRepository {
  Future<void> saveAllVehicles(Map<String, String> mapHeadresAutorization);
  Future<void> getUserAuthToken(String username, String password);
}
