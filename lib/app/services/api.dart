import 'package:coronavirus_rest_api_flutter_course/app/services/api_keys.dart';

class API{
  API({required this.apiKey});
  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandbowKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUrl() => Uri(scheme: 'https',host: host,path: 'token');

}