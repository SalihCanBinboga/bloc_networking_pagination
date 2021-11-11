abstract class PassengerApi {
  Future<String> getPassengersWithPagination({
    int page = 0,
    int limit = 10,
  });
}
