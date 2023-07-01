import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/presentations/home/model/home_user_info_model.dart';
import 'package:flutter/material.dart';

import '../../../domains/event/model/event_info_model.dart';
import '../../../domains/user/repository/user_repository.dart';
import '../model/home_event_model.dart';

class HomeModelView extends ChangeNotifier {
  /// Domains
  UserRepository userRepository = UserRepository();
  EventRepository eventRepository = EventRepository();

  /// Core Attributes
  late BuildContext ctx;

  /// Attributes
  late HomeUserInfoModel userInfo;

  /// Core Methods
  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  void inializeMethods() async {
    fetchUserInfo();
    fetchGoingEvent();
  }

  void fetchUserInfo() {
    userInfo = HomeUserInfoModel(
      name: userRepository.getUserInfo()!.name,
      surname: userRepository.getUserInfo()!.surname,
    );
  }

  void clickEvent(int eventId) {

  }

  /// Home Going
  bool isSeeAllGoingEventList = false;
  List<HomeEventModel> goingEventList = [];

  void changeSeeAllGoingEvent() {
    isSeeAllGoingEventList = !isSeeAllGoingEventList;
    notifyListeners();
  }

  void fetchGoingEvent() {
    goingEventList = eventRepository
        .getJoinedEvents()
        .where((e) => e.startTime.isAfter(DateTime.now()))
        .map((e) => HomeEventModel.fromEventInfoModel(e))
        .toList();
  }
}
