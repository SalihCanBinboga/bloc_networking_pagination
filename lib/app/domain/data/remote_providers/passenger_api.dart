import '../../../data/data_providers/remote/i_passenger_api.dart';

import '../../constants/app_constants.dart';
import 'package:http/http.dart' as http;

class PassengerApi implements IPassengerApi {
  static final PassengerApi _authenticationAPI = PassengerApi._internal();

  factory PassengerApi() => _authenticationAPI;

  PassengerApi._internal();

  /// Yolcu listesini getiren servis.
  @override
  Future<String> getPassengersWithPagination({
    int page = 0,
    int limit = 10,
  }) async {
    final rawResponse = await http.get(Uri.parse('${AppConstants.kBaseEndPoint}/?page=$page&size=$limit'));
    return rawResponse.body;
  }
}
