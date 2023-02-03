import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_buttons/my_text_button_widget.dart';
import '../model_view/sign_up_model_view.dart';


class SignUpSignInButtonWidget extends StatelessWidget {
  const SignUpSignInButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpModelView signUpMV = context.read<SignUpModelView>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        MyTextButtonWidget(
          text: "Sign Up",
          onTanFunc: signUpMV.signInTextButtonFunc,
        ),
      ],
    );
  }
}
