import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:flutter/material.dart';

import '../model/profile_event_model.dart';

class ProfileModelView extends ChangeNotifier {
  BuildContext? ctx;

  /// Update Context data
  void updateContextData(BuildContext context) {
    ctx = context;
  }

  /// Dummy Values
  List<ProfileEventModel> myEventsList = [
    ProfileEventModel(
      eventId: 1,
      eventDate: "Tomorrow",
      eventTime: "6:30 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "Batak",
      numberCurrentMember: 5,
      numberMaxMember: 24,
    ),
    ProfileEventModel(
      eventId: 2,
      eventDate: "Tomorrow",
      eventTime: "6:45 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "Okey",
      numberCurrentMember: 3,
      numberMaxMember: 8,
    ),
    ProfileEventModel(
      eventId: 3,
      eventDate: "29.03.22",
      eventTime: "8:30 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "101",
      numberCurrentMember: 5,
      numberMaxMember: 6,
    ),
  ];
  List<ProfileEventModel> upcomingEventsList = [
    ProfileEventModel(
      eventId: 1,
      eventDate: "Tomorrow",
      eventTime: "6:30 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "Batak",
      numberCurrentMember: 5,
      numberMaxMember: 24,
    ),
    ProfileEventModel(
      eventId: 2,
      eventDate: "Tomorrow",
      eventTime: "6:45 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "Okey",
      numberCurrentMember: 3,
      numberMaxMember: 8,
    ),
    ProfileEventModel(
      eventId: 3,
      eventDate: "29.03.22",
      eventTime: "8:30 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "101",
      numberCurrentMember: 5,
      numberMaxMember: 6,
    ),
  ];
  List<ProfileEventModel> pastEventsList = [
    ProfileEventModel(
      eventId: 1,
      eventDate: "Tomorrow",
      eventTime: "6:30 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "Batak",
      numberCurrentMember: 5,
      numberMaxMember: 24,
    ),
    ProfileEventModel(
      eventId: 2,
      eventDate: "Tomorrow",
      eventTime: "6:45 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "Okey",
      numberCurrentMember: 3,
      numberMaxMember: 8,
    ),
    ProfileEventModel(
      eventId: 3,
      eventDate: "29.03.22",
      eventTime: "8:30 pm",
      eventPlace: "Caribou Coffee",
      eventTitle: "101",
      numberCurrentMember: 5,
      numberMaxMember: 6,
    ),
  ];

  /// My Events
  String myEventsIconPath = circularMore;
  void myEventsFunc(int eventId) {
    print("$eventId does something");
  }

  /// Upcoming Events
  String upcomingEventsIconPath = closeRed;
  void upcomingEventsFunc(int eventId) {
    upcomingEventsList.removeWhere((element) => element.eventId == eventId);
    notifyListeners();
  }
}
