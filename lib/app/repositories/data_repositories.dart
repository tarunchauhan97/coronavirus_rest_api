import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api_service.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository({required this.apiService});

  final APIService apiService;
  String? _accessToken;

  Future<int> getEndPointData(EndPoint endPoint) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await apiService.getEndpointData(accessToken: _accessToken!, endPoint: endPoint);
    } on Response catch (response) {
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await apiService.getEndpointData(accessToken: _accessToken!, endPoint: endPoint);
      }
      rethrow;
    }
  }

// Future<int> getEndPointData(EndPoint endPoint) async {
//   final accessToken = await apiService.getAccessToken();
//   return await apiService.getEndpointData(accessToken: accessToken, endPoint: endPoint);
// }
}
