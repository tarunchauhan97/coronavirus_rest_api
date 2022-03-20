import 'package:coronavirus_rest_api_flutter_course/app/repositories/endpoints_data.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:coronavirus_rest_api_flutter_course/app/services/endpoint_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCacheService {
  DataCacheService({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  static String endpointValueKey(EndPoint endpoint) => '$endpoint/value';

  static String endpointDateKey(EndPoint endpoint) => '$endpoint/date';

  EndPointsData getData() {
    Map<EndPoint, EndpointData> values = {};
    EndPoint.values.forEach((endPoint) {
      final value = sharedPreferences.getInt(endpointValueKey(endPoint));
      final dateString = sharedPreferences.getString(endpointDateKey(endPoint));
      if (value != null && dateString != null) {
        final date = DateTime.tryParse(dateString);
        values[endPoint] = EndpointData(value: value, date: date);
      }
    });
    return EndPointsData(values: values);
  }

  Future<void> setData(EndPointsData endPointsData) async {
    endPointsData.values.forEach((endPoint, endPointData) async {
      await sharedPreferences.setInt(endpointValueKey(endPoint), endPointData.value);
      await sharedPreferences.setString(
          endpointDateKey(endPoint), endPointData.date!.toIso8601String());
    });
  }
}
