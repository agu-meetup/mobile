import 'dart:async';

import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:flutter/material.dart';

class BottomBarModelView extends ChangeNotifier {
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
}
