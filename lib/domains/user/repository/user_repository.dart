import 'package:agu_meetup_mobile/data/user/datasources/user_server_datasource.dart';
import 'package:agu_meetup_mobile/data/user/models/update_user_info_request.dart';

import '../../../data/user/models/get_user_info_response_model.dart';

class UserRepository {
  /// Data Layers
  UserServerDatasource userServerDatasource = UserServerDatasource();

  /// Attributes
  static GetUserInfoResponseModel? userInfo;

  Future<void> fetchUserInfoFromDS() async {
    userInfo = await userServerDatasource.getUserInfo();
  }

  Future<void> updateUserInfoFromDS(
      UpdateUserInfoRequest updateUserInfoRequest) async {
    userInfo = await userServerDatasource.updateUserInfo(updateUserInfoRequest);
  }

  void makeUserInfoNull() {
    userInfo = null;
  }

  GetUserInfoResponseModel? getUserInfo() {
    return userInfo;
  }
}
