import 'package:flutter/material.dart';

import '../model/notification_card_model.dart';

class NotificationModelView extends ChangeNotifier {
  BuildContext? ctx;

  /// Update Context data
  void updateContextData(BuildContext context) {
    ctx = context;
  }

  /// Test Data
  List<NotificationCardModel> cardsInfo = [
    NotificationCardModel(
      id: 1,
      notificationTitle: "Az kaldı",
      eventTitle: "Batal",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
    NotificationCardModel(
      id: 2,
      notificationTitle: "Azzz",
      eventTitle: "Batakkk",
      date: "12.12.2023",
      time: "21:45",
      locationName: "Hasan Kıraathanesi",
      city: "Kocasinan",
    ),
    NotificationCardModel(
      id: 3,
      notificationTitle: "Az kaldı",
      eventTitle: "Yeni Oyun",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
    NotificationCardModel(
      id: 4,
      notificationTitle: "Az123",
      eventTitle: "Batal",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
    NotificationCardModel(
      id: 5,
      notificationTitle: "Az asdfasf",
      eventTitle: "Batal",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
  ];

  void deleteNotificationById(int id) {
    cardsInfo.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}
