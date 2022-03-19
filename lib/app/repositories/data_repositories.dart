import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api_service.dart';

class DataRepository {
  DataRepository({required this.apiService});

  final APIService apiService;

  Future<int> getEndPointData(EndPoint endPoint) async {
    final accessToken = await apiService.getAccessToken();
    return await apiService.getEndpointData(accessToken: accessToken, endPoint: endPoint);
  }
}
