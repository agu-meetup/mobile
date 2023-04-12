import 'dart:async';

import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';
import 'package:flutter/material.dart';

class BottomBarModelView extends ChangeNotifier {
  bool isPageLoaded = false;
  int currentBarIndex = 0;
  final _isCurrentBarIndex = StreamController<int>.broadcast();

  Stream<int> get loadingStatus async* {
    yield currentBarIndex;
    yield* _isCurrentBarIndex.stream;
  }

  void changeBarIndex(int newBarIndex) {
    currentBarIndex = newBarIndex;
    _isCurrentBarIndex.add(newBarIndex);
    notifyListeners();
  }

  /// Home Button Components
  String homeButtonActiveIcon = homeButtonActive;
  String homeButtonPassiveIcon = homeButtonPassive;

  /// Search Button Components
  String searchButtonActiveIcon = searchButtonActive;
  String searchButtonPassiveIcon = searchButtonPassive;

  /// Notification Button Components
  String notificationButtonActiveIcon = notificationButtonActive;
  String notificationButtonPassiveIcon = notificationButtonPassive;

  /// Profile Button Components
  String profileButtonActiveIcon = profileButtonActive;
  String profileButtonPassiveIcon = profileButtonPassive;

  ///*** Methods initialize before app ***///
  /// Repositories
  EventRepository eventRepository = EventRepository();
  UserRepository userRepository = UserRepository();

  void initializeMethods() async{
    isPageLoaded = false;
    await fetchBookmarksEventIds();
    isPageLoaded = true;
    notifyListeners();
  }

  Future<void> fetchBookmarksEventIds() async {
    await eventRepository
        .fetchBookmarksEventIdsFromDS(userRepository.getUserInfo()!.id);
  }
}
