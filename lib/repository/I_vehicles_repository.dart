abstract class IVehiclesRepository {
  Future<void> getAllVehicles(Map<String, String> mapHeadresAutorization);
  Future<void> getUserAuthToken(String username, String password);
}
