import 'dart:async';

import 'package:agu_meetup_mobile/core/exceptions.dart';
import 'package:agu_meetup_mobile/data/sign_in/models/sign_in_request_model.dart';
import 'package:agu_meetup_mobile/domains/sign_in/repository/sign_in_repository.dart';
import 'package:agu_meetup_mobile/presentations/authentication/view/authentication_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../sign_up/view/sign_up_view.dart';

class SignInModelView extends ChangeNotifier {
  SignInRepository signInRepository = SignInRepository();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BuildContext? ctx;

  /// Update Context data
  void updateContextData(BuildContext context) {
    ctx = context;
  }

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
  Future<void> signInButtonFunc() async {
    if (formKey.currentState!.validate()) {
      try {
        await signInRepository.signInRepo(
          SignInRequestModel(
            email: emailVal!,
            password: passwordVal!,
          ),
        );

        /// Auth router
        Navigator.pushAndRemoveUntil(
            ctx!,
            MaterialPageRoute(builder: (_) => AuthenticationView()),
            (route) => false);
        print("Let\'s sign in");
      } catch (e) {
        if (e == WrongEmailOrPassword) {
          print("Wrong Password or Email");
        } else {
          print(e);
        }
      }
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
