import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Service {
  static String? jwtToken;
  static String baseUrl = "192.168.1.104:3006";

  Future<Response> postRequest({
    required String pathRequest,
    required String parameters,
    bool isRequiredToken = true,
  }) async {
    var client = http.Client();
    var url = Uri.http(baseUrl, pathRequest);
    var response = await client.post(
      url,
      headers: {
        'Content-type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
      },
      body: parameters,
    );
    return response;
  }
}
