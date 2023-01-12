import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class SignInTextsWidget extends StatelessWidget {
  const SignInTextsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: kNavyBlue,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Sign in to continue",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: kDarkGray,
            ),
          ),
        ),
      ],
    );
  }
}
