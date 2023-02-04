import 'dart:convert';

import 'package:agu_meetup_mobile/core/exceptions.dart';
import 'package:agu_meetup_mobile/core/service.dart';
import 'package:http/http.dart';

import '../models/sign_in_request_model.dart';

class SignInServerDatasource {
  Service service = Service();

  Future<String> signInDS(SignInRequestModel signInRequestModel) async {
    Response response = await service.postRequest(
      pathRequest: "api/auth/user/userLogin",
      parameters: jsonEncode(signInRequestModel.toJson()),
    );

    var responseMap = jsonDecode(response.body);
    if (responseMap['status'] == 'success') {
      return responseMap['token'];
    } else {
      throw WrongEmailOrPassword();
    }
  }
}
