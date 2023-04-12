import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyService {
  static String? jwtToken;
  static String baseUrl = "192.168.1.104:3006";

  void updateJwtToken(String? newJwtToken) {
    jwtToken = newJwtToken;
  }

  Future<Response> postRequest({
    required String pathRequest,
    required String parameters,
    bool isRequiredToken = true,
  }) async {
    var headersMap = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };
    if (isRequiredToken) {
      headersMap["Authorization"] = "bearer ${jwtToken!}";
    }
    var client = http.Client();
    var url = Uri.http(baseUrl, pathRequest);
    var response = await client.post(
      url,
      headers: headersMap,
      body: parameters,
    );
    return response;
  }

  Future<Response> getRequest({
    required String pathRequest,
    bool isRequiredToken = true,
  }) async {
    var headersMap = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };
    if (isRequiredToken) {
      headersMap["Authorization"] = "bearer ${jwtToken!}";
    }
    var client = http.Client();
    var url = Uri.http(baseUrl, pathRequest);
    var response = await client.get(
      url,
      headers: headersMap,
    );
    return response;
  }

  Future<Response> putRequest({
    required String pathRequest,
    required String parameters,
    bool isRequiredToken = true,
  }) async {
    var headersMap = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };
    if (isRequiredToken) {
      headersMap["Authorization"] = "bearer ${jwtToken!}";
    }
    var client = http.Client();
    var url = Uri.http(baseUrl, pathRequest);
    var response = await client.put(
      url,
      headers: headersMap,
      body: parameters,
    );
    return response;
  }

  Future<Response> deleteRequest({
    required String pathRequest,
    required String parameters,
    bool isRequiredToken = true,
  }) async {
    var headersMap = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };
    if (isRequiredToken) {
      headersMap["Authorization"] = "bearer ${jwtToken!}";
    }
    var client = http.Client();
    var url = Uri.http(baseUrl, pathRequest);
    var response = await client.delete(
      url,
      headers: headersMap,
      body: parameters,
    );
    return response;
  }
}
