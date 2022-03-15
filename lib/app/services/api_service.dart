import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final response = await http.post(
      //api.tokenUri().toString(),
      api.tokenUri(),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );
  }
}
