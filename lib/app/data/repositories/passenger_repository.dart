import '../../domain/models/passenger.dart';

abstract class PassengerRepository{
  Future<Iterable<Passenger>> getPassengers({
    int page = 0,
    int limit = 10,
  });
}