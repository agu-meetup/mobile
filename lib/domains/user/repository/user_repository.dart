import 'package:agu_meetup_mobile/data/user/datasources/user_server_datasource.dart';

import '../../../data/user/models/get_user_info_response_model.dart';

class UserRepository {
  /// Data Layers
  UserServerDatasource userServerDatasource = UserServerDatasource();

  /// Attributes
  static GetUserInfoResponseModel? userInfo;

  Future<void> updateUserInfo() async {
    userInfo = await userServerDatasource.getUserInfo();
  }

  GetUserInfoResponseModel? getUserInfo() {
    return userInfo;
  }
}