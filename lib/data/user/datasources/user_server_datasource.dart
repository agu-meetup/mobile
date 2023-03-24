import 'dart:convert';

import 'package:agu_meetup_mobile/core/exceptions.dart';
import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:agu_meetup_mobile/data/user/models/get_user_info_response_model.dart';
import 'package:agu_meetup_mobile/data/user/models/update_user_info_request.dart';
import 'package:http/http.dart';

class UserServerDatasource {
  MyService myService = MyService();

  Future<GetUserInfoResponseModel?> getUserInfo() async {
    Response response = await myService.getRequest(
      pathRequest: "api/user/UserInfo",
    );

    if (response.statusCode == 200){
      var responseMap = jsonDecode(response.body);
      return GetUserInfoResponseModel.fromJson(responseMap['user']);
    }
    else {
      return null;
    }
  }

  Future<GetUserInfoResponseModel?> updateUserInfo(UpdateUserInfoRequest updateUserInfoRequest) async {
    Response response = await myService.postRequest(
      parameters: jsonEncode(updateUserInfoRequest.toJson()),
      pathRequest: "api/user/userUpdate",
    );

    if (response.statusCode == 200){
      var responseMap = jsonDecode(response.body);
      return GetUserInfoResponseModel.fromJson(responseMap['detail']);
    }
    else if(response.statusCode == 401) {
      throw InvalidToken();
    }
    else {
      throw UpdateUserError();
    }
  }
}
