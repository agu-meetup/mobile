import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSelectionViewModel extends ChangeNotifier {
  String? selectedForgotPasswordWay;

  /// Email selection
  String emailType = "Email";
  String emailInfoText = "via Email";
  String emailIcon = mailRed;

  /// Phone selection
  String phoneType = "Phone";
  String phoneInfoText = "via Phone";
  String phoneIcon = chatRed;

  void changeSelectedWay(String newWay) {
    selectedForgotPasswordWay = newWay;
    notifyListeners();
  }
}
