import 'package:flutter/material.dart';

import '../../widgets/wid_text_button_widget.dart';

class SignInSignUpButtonWidget extends StatelessWidget {
  const SignInSignUpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont\'t have an account?"),
        WidTextButtonWidget(
          text: "Sign Up",
        ),
      ],
    );
  }
}
