import 'package:agu_meetup_mobile/features/sign_up/presentation/model_view/sign_up_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/wid_text_button_widget.dart';

class SignUpSignInButtonWidget extends StatelessWidget {
  const SignUpSignInButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpModelView signUpMV = context.read<SignUpModelView>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        WidTextButtonWidget(
          text: "Sign Up",
          onTanFunc: signUpMV.signInTextButtonFunc,
        ),
      ],
    );
  }
}
