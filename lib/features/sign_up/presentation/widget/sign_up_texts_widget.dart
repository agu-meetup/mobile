import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class SignUpTextsWidget extends StatelessWidget {
  const SignUpTextsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Hello!",
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
            "Create a new account",
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
