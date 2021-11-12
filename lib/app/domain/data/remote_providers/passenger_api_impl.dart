import '../../../data/data_providers/remote/passenger_api.dart';

import '../../constants/app_constants.dart';
import 'package:http/http.dart' as http;

class PassengerApiImpl implements PassengerApi {
  static final PassengerApiImpl _authenticationAPI = PassengerApiImpl._internal();

  factory PassengerApiImpl() => _authenticationAPI;

  PassengerApiImpl._internal();

  /// Yolcu listesini getiren servis.
  @override
  Future<String> getPassengersWithPagination({
    int page = 0,
    int limit = 15,
  }) async {
    final rawResponse = await http.get(Uri.parse('${AppConstants.kBaseEndPoint}/passenger?page=$page&size=$limit'));
    if (rawResponse.statusCode != 200) {
      throw Exception('Request Failed: ${rawResponse.statusCode}');
    }
    return rawResponse.body;
  }
}
