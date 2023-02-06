import 'dart:convert';

import 'package:agu_meetup_mobile/core/exceptions.dart';
import 'package:agu_meetup_mobile/core/service.dart';
import 'package:agu_meetup_mobile/data/sign_up/models/sign_up_request_model.dart';
import 'package:http/http.dart';

class SignUpServerDatasource {
  Service service = Service();

  Future<void> signUpDS(SignUpRequestModel signUpRequestModel) async {
    Response response = await service.postRequest(
      pathRequest: "api/auth/user/userSignup",
      parameters: jsonEncode(signUpRequestModel.toJson()),
    );

    if (response.statusCode == 201) {
      return;
    } else if (response.statusCode == 401) {
      throw EmailAlreadyUsed();
    }
  }
}
