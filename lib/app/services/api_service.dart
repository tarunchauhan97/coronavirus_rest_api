import 'dart:convert';

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
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    print(
        'Request ${api.tokenUri()} failed \n Response: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
