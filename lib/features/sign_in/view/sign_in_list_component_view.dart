import 'package:agu_meetup_mobile/features/sign_in/model_view/sign_in_model_view.dart';
import 'package:agu_meetup_mobile/features/widgets/wid_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../widgets/wid_text_button_widget.dart';
import '../../widgets/wid_text_field_widget.dart';
import '../widgets/sign_in_sign_up_button_widget.dart';
import '../widgets/sign_in_texts_widget.dart';

class SignInListComponentView extends StatefulWidget {
  const SignInListComponentView({Key? key}) : super(key: key);

  @override
  State<SignInListComponentView> createState() =>
      _SignInListComponentViewState();
}

class _SignInListComponentViewState extends State<SignInListComponentView> {
  @override
  Widget build(BuildContext context) {
    SignInModelView signInMV = context.read<SignInModelView>();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: signInMV.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SignInTextsWidget(),
            const SizedBox(height: 16),
            WidTextFieldWidget(
              hintText: "E-mail",
              ctr: signInMV.emailCtr,
              validatorFunc: signInMV.emailValidatorFunc,
              textInputType: signInMV.emailTextInputType,
            ),
            const SizedBox(height: 16),
            StreamBuilder<bool>(
              stream: signInMV.isEyeOpenStream(),
              builder: (context, snapshot) {
                return WidTextFieldWidget(
                  hintText: "Password",
                  ctr: signInMV.passwordCtr,
                  validatorFunc: signInMV.passwordValidatorFunc,
                  isPassword: true,
                  isSecure: snapshot.data ?? true,
                  changePasswordEye: signInMV.changePasswordEye,
                );
              },
            ),
            WidTextButtonWidget(
              text: "Forgot Password?",
            ),
            const SizedBox(height: 32),
            WidButtonWidget(
              buttonText: "Sign In",
              buttonTextColor: kWhite,
              backgroundColor: kNavyBlue,
              onTapFunction: signInMV.signInButtonFunc,
            ),
            SignInSignUpButtonWidget(),
          ],
        ),
      ),
    );
  }
}
