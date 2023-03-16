import 'dart:convert';

import 'package:agu_meetup_mobile/core/exceptions.dart';
import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:agu_meetup_mobile/data/user/models/get_user_info_response_model.dart';
import 'package:http/http.dart';

class UserServerDatasource {
  MyService myService = MyService();

  Future<GetUserInfoResponseModel?> getUserInfo() async {
    print("we are in user server DS");
    Response response = await myService.getRequest(
      pathRequest: "api/user/UserInfo",
    );

    if (response.statusCode == 200){
      var responseMap = jsonDecode(response.body);
      print("RESPONSE MAP");
      print(responseMap);
      return GetUserInfoResponseModel.fromJson(responseMap['user']);
    }
    else {
      return null;
    }
  }
}
