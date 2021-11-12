import 'dart:convert';

import '../../../data/repositories/passenger_repository.dart';
import '../../../data/data_providers/remote/passenger_api.dart';
import '../../models/passenger.dart';

class PassengerRepositoryImpl implements PassengerRepository {
  final PassengerApi _passengerApi;

  PassengerRepositoryImpl({required PassengerApi passengerApi}) : _passengerApi = passengerApi;

  @override
  Future<Iterable<Passenger>> getPassengers({
    int page = 0,
    int limit = 15,
  }) async {
    final response = await _passengerApi.getPassengersWithPagination(
      page: page,
      limit: limit,
    );

    final decodedBody = jsonDecode(response);
    final iterableBody = decodedBody['data'] as Iterable;

    return iterableBody.map((e) => Passenger.fromMap(e));
  }
}
