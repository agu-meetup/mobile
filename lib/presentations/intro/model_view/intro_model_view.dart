import 'dart:async';

import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

import '../../sign_in/view/sign_in_view.dart';

class IntroModelView extends ChangeNotifier {
  bool isLoading = true;
  final _isLoadingController = StreamController<bool>.broadcast();

  Stream<bool> get loadingStatus async* {
    if (isLoading == true) {
      yield true;
    } else {
      yield false;
    }
    yield* _isLoadingController.stream;
  }

  void changeIsLoading(bool newIsLoading) async {
    isLoading = newIsLoading;
    _isLoadingController.add(newIsLoading);
  }

  /// Logo and app name properties
  String logoName = "LOGO";
  String appName = "app name";

  /// Sign Up Button Properties
  String signUpButtonText = "Sign Up";
  Color signUpButtonTextColor = kNavyBlue;
  Color signUpButtonBackgroundColor = kWhite;
  Function signUpButton(BuildContext context) => () {
        /// Router to sign up page
        print("go sign up page");
      };

  ///Login Button Properties
  String loginButtonText = "Log in to my account";
  Color loginButtonTextColor = kWhite;
  Color loginButtonBackgroundColor = kWhite;
  double loginButtonOpacity = 0.15;
  Function loginButton(BuildContext context) => () {
        /// Router to login page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SignInView(),
          ),
        );
      };
}
