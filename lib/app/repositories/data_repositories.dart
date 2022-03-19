import 'package:coronavirus_rest_api_flutter_course/app/repositories/endpoints_data.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api_service.dart';
import 'package:http/http.dart';

class DataRepository {
  DataRepository({required this.apiService});

  final APIService apiService;
  String _accessToken = '';

  Future<int> getEndPointData(EndPoint endPoint) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await apiService.getEndpointData(accessToken: _accessToken, endPoint: endPoint);
    } on Response catch (response) {
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await apiService.getEndpointData(accessToken: _accessToken, endPoint: endPoint);
      }
      rethrow;
    }
  }

  Future<EndPointsData> getAllEndPointsData() async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await _getAllEndpointsData();
    } on Response catch (response) {
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await _getAllEndpointsData();
      }
      rethrow;
    }
  }

  // Future<T> _getDataRefreshingToken<T>({Future<T> Function() onGetData}) async {
  //   try {
  //     if (_accessToken == null) {
  //       _accessToken = await apiService.getAccessToken();
  //     }
  //     return await onGetData();
  //   } on Response catch (response) {
  //     if (response.statusCode == 401) {
  //       _accessToken = await apiService.getAccessToken();
  //       return await onGetData();
  //     }
  //     rethrow;
  //   }
  // }

  Future<EndPointsData> _getAllEndpointsData() async {
    final values = await Future.wait([
      apiService.getEndpointData(accessToken: _accessToken, endPoint: EndPoint.cases),
      apiService.getEndpointData(accessToken: _accessToken, endPoint: EndPoint.casesSuspected),
      apiService.getEndpointData(accessToken: _accessToken, endPoint: EndPoint.casesConfirmed),
      apiService.getEndpointData(accessToken: _accessToken, endPoint: EndPoint.deaths),
      apiService.getEndpointData(accessToken: _accessToken, endPoint: EndPoint.recovered),
    ]);
    return EndPointsData(values: {
      EndPoint.cases: values[0],
      EndPoint.casesSuspected: values[1],
      EndPoint.casesConfirmed: values[2],
      EndPoint.deaths: values[3],
      EndPoint.recovered: values[4],
    });
  }

// Future<int> getEndPointData(EndPoint endPoint) async {
//   final accessToken = await apiService.getAccessToken();
//   return await apiService.getEndpointData(accessToken: accessToken, endPoint: endPoint);
// }
}
