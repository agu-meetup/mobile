import 'dart:convert';

import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:http/http.dart';

import '../../../core/exceptions.dart';

class ForgotPasswordServerDatasource {
  MyService myService = MyService();

  Future<int> codeSender({required String email}) async {
    Response response = await myService.postRequest(
      pathRequest: "api/password/codeSender",
      parameters: jsonEncode({"email": email}),
      isRequiredToken: false,
    );

    var responseMap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return responseMap['result']['user_id'];
    } else {
      throw ForgotPasswordCodeSenderError();
    }
  }

  Future<void> verifyCode(
      {required int userId, required int recoveryCode}) async {
    Response response = await myService.postRequest(
      pathRequest: "api/password/verifyCode",
      parameters: jsonEncode({"user_id": userId, "code": recoveryCode}),
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw ForgotPasswordVerifyCodeError();
    }
  }

  Future<void> resetPassword(
      {required int userId, required String newPassword}) async {
    Response response = await myService.postRequest(
      pathRequest: "api/password/reset",
      parameters: jsonEncode({"user_id": userId, "new_password": newPassword}),
      isRequiredToken: false,
    );

    if (response.statusCode == 200){
      return;
    }
    else {
      throw ForgotPasswordResetPasswordError();
    }
  }
}
