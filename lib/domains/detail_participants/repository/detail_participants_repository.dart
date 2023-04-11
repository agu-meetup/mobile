import 'package:agu_meetup_mobile/data/user/datasources/user_server_datasource.dart';
import 'package:agu_meetup_mobile/data/user/models/get_user_info_response_model.dart';

import '../../../presentations/detail_participants/model/detail_participants_card_model.dart';

class DetailParticipantsRepository {
  /// Data Layers
  UserServerDatasource userServerDatasource = UserServerDatasource();

  /// Attributes
  static List<int> userIdList = [];

  void updateUserIdList(List<int> newUserIdList) {
    userIdList = newUserIdList;
  }

  Future<List<DetailParticipantsCardModel>> fetchUserCardInfoListFromDB() async {
    List<DetailParticipantsCardModel> getUserInfoList = [];
    for (int userId in userIdList) {
      GetUserInfoResponseModel getUserInfoResponseModel =
          await userServerDatasource.getUserInfoById(userId);
      getUserInfoList.add(
        DetailParticipantsCardModel(
            userId: getUserInfoResponseModel.id,
            profileImagePath: "profileImagePath",
            name: getUserInfoResponseModel.name,
            surname: getUserInfoResponseModel.surname,
            email: getUserInfoResponseModel.email),
      );
    }
    return getUserInfoList;
  }
}
