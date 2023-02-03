import 'dart:async';

import 'package:agu_meetup_mobile/features/sign_up/presentation/view/sign_up_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignInModelView extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Sign In Properties
  String emailHintText = "E-mail";
  String? emailVal;
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

  void changeEmailVal(String? newEmailVal) {
    emailVal = newEmailVal;
  }

  /// Password Properties
  String passwordHintText = "Password";
  String? passwordVal;
  final isEyeOpenController = StreamController<bool>.broadcast();
  Stream<bool> isEyeOpenStream() async* {
    yield true;
    yield* isEyeOpenController.stream;
  }

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
    isEyeOpenController.add(newEyeOpen);
    notifyListeners();
  }

  /// Forgot Password Properties
  void goForgotPasswordPage(BuildContext context) {
    // go forgot password
  }

  /// Sign In Button Properties
  void signInButtonFunc() {
    if (formKey.currentState!.validate()) {
      print("Let\'s sign in");
    }
  }

  /// Sign Up Button Properties
  void goSignUpPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignUpView()),
        (route) => false);
  }
}
