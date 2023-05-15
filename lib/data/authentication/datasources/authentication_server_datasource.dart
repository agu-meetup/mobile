import 'dart:convert';

import 'package:http/http.dart';

import '../../../core/exceptions.dart';
import '../../../core/my_service.dart';
import '../models/sign_in_request_model.dart';
import '../models/sign_up_request_model.dart';

class AuthenticationServerDatasource {
  MyService myService = MyService();

  Future<String> signInDS(SignInRequestModel signInRequestModel) async {
    Response response = await myService.postRequest(
      pathRequest: "api/auth/user/userLogin",
      parameters: jsonEncode(signInRequestModel.toJson()),
      isRequiredToken: false,
    );

    var responseMap = jsonDecode(response.body);
    if (responseMap['status'] == 'success') {
      return responseMap['token'];
    } else {
      throw WrongEmailOrPassword();
    }
  }

  Future<void> signUpDS(SignUpRequestModel signUpRequestModel) async {
    Response response = await myService.postRequest(
      pathRequest: "api/auth/user/userSignup",
      parameters: jsonEncode(signUpRequestModel.toJson()),
      isRequiredToken: false,
    );

    if (response.statusCode == 201) {
      return;
    } else if (response.statusCode == 401) {
      throw EmailAlreadyUsed();
    }
  }

}