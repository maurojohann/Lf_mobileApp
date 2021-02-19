import 'package:mobile_app/ui/models/vehicles.dart';

abstract class IVehiclesRepository {
  Future<void> saveAllVehicles(Map<String, String> mapHeadresAutorization);
}
