import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInModelView extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Sign In Properties
  String emailHintText = "E-mail";
  TextEditingController emailCtr = TextEditingController();
  TextInputType emailTextInputType = TextInputType.emailAddress;
  String? emailValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter valid email";
    }
    if (!EmailValidator.validate(val)) {
      return "Please enter valid email";
    }
    return null;
  }

  /// Password Properties
  String passwordHintText = "Password";
  TextEditingController passwordCtr = TextEditingController();
  final isEyeOpenController = StreamController<bool>();
  Stream<bool> isEyeOpenStream() async* {
    yield true;
    yield* isEyeOpenController.stream;
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
    isEyeOpenController.add(newEyeOpen);
    notifyListeners();
  }

  /// Sign In Button Properties
  void signInButtonFunc() {
    if (formKey.currentState!.validate()) {
      print("Let\'s sign in");
    }
  }
}
