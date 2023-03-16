import 'dart:async';

import 'package:agu_meetup_mobile/core/exceptions.dart';
import 'package:agu_meetup_mobile/presentations/authentication/view/authentication_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../data/authentication/models/sign_in_request_model.dart';
import '../../../domains/authentication/repository/authentication_repository.dart';
import '../../forgot_password/view/forgot_password_view.dart';
import '../../sign_up/view/sign_up_view.dart';

class SignInModelView extends ChangeNotifier {
  AuthenticationRepository authenticationRepository = AuthenticationRepository();
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
  bool isEyeOpen = true;

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
    isEyeOpen = newEyeOpen;
    notifyListeners();
  }

  /// Forgot Password Properties
  void goForgotPasswordPage() {
    Navigator.push(
        ctx!,
        MaterialPageRoute(
          builder: (_) => ForgotPasswordView(),
        ));
    // go forgot password
  }

  /// Sign In Button Properties
  Future<void> signInButtonFunc() async {
    if (formKey.currentState!.validate()) {
      try {
        await authenticationRepository.signIn(
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
  void goSignUpPage() {
    Navigator.pushAndRemoveUntil(
        ctx!,
        MaterialPageRoute(builder: (_) => const SignUpView()),
        (route) => false);
  }
}
