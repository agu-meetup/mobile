import 'package:flutter/material.dart';

class ForgotPasswordChangeViewModel extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Password Properties
  String passwordHintText = "Password";
  String? passwordVal;
  bool passwordIsEyeOpen = true;

  void changePasswordVal(String? newPasswordVal) {
    passwordVal = newPasswordVal;
  }

  String? passwordValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter password more 6 character";
    }
    if (val.length < 6) {
      return "Please enter password more 6 character";
    }
    return null;
  }

  void changePasswordEye(bool newEyeOpen) {
    passwordIsEyeOpen = newEyeOpen;
    notifyListeners();
  }

  /// Password Again Properties
  String passwordAgainHintText = "Password Again";
  String? passwordAgainVal;
  bool passwordAgainIsEyeOpen = true;

  void changePasswordAgainVal(String? newPasswordAgainVal) {
    passwordAgainVal = newPasswordAgainVal;
  }

  String? passwordAgainValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter password more 6 character";
    }
    if (val.length < 6) {
      return "Please enter password more 6 character";
    }
    if (passwordVal != passwordAgainVal) {
      return "Please enter same password";
    }
    return null;
  }

  void changePasswordAgainEye(bool newEyeOpen) {
    passwordAgainIsEyeOpen = newEyeOpen;
    notifyListeners();
  }

  /// Continue button
  void continueButtonFunc() {
    if (formKey.currentState!.validate()) {
      print("go");
    }
  }
}
