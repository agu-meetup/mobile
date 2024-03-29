import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_buttons/my_text_button_widget.dart';
import '../model_view/sign_in_model_view.dart';

class SignInSignUpButtonWidget extends StatelessWidget {
  const SignInSignUpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInModelView signInMV = context.read<SignInModelView>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont\'t have an account?"),
        MyTextButtonWidget(
          text: "Sign Up",
          onTanFunc: signInMV.goSignUpPage,
        ),
      ],
    );
  }
}
