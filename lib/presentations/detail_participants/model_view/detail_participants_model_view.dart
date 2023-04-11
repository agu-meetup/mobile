import 'package:agu_meetup_mobile/domains/detail_participants/repository/detail_participants_repository.dart';
import 'package:flutter/material.dart';

import '../model/detail_participants_card_model.dart';

class DetailParticipantsModelView extends ChangeNotifier {
  /// Domain Layers
  DetailParticipantsRepository detailParticipantsRepository = DetailParticipantsRepository();

  late BuildContext ctx;
  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  List<DetailParticipantsCardModel> userCardList = [];

  bool isPageLoaded = false;
  void initializeMethods() async{
    isPageLoaded = false;
    await fetchParticipatedUsers();
    isPageLoaded = true;
    notifyListeners();
  }

  Future<void> fetchParticipatedUsers() async{
    userCardList.clear();
    userCardList = await detailParticipantsRepository.fetchUserCardInfoListFromDB();
  }

}