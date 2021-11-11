abstract class IPassengerApi {
  Future<String> getPassengersWithPagination({
    int page = 0,
    int limit = 10,
  });
}
