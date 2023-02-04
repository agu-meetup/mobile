import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../components/my_buttons/my_button_widget.dart';
import '../../../components/my_buttons/my_text_button_widget.dart';
import '../../../components/my_textfields/my_text_field_widget.dart';
import '../model_view/sign_in_model_view.dart';
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
    signInMV.updateContextData(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Form(
        key: signInMV.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SignInTextsWidget(),
            const SizedBox(height: 16),
            MyTextFieldWidget(
              hintText: "E-mail",
              changeValueFunc: signInMV.changeEmailVal,
              validatorFunc: signInMV.emailValidatorFunc,
              textInputType: signInMV.emailTextInputType,
            ),
            const SizedBox(height: 16),
            StreamBuilder<bool>(
              stream: signInMV.isEyeOpenStream(),
              builder: (context, snapshot) {
                return MyTextFieldWidget(
                  hintText: "Password",
                  changeValueFunc: signInMV.changePasswordVal,
                  validatorFunc: signInMV.passwordValidatorFunc,
                  isPassword: true,
                  isSecure: snapshot.data ?? true,
                  changePasswordEye: signInMV.changePasswordEye,
                );
              },
            ),
            MyTextButtonWidget(
              text: "Forgot Password?",
              onTanFunc: signInMV.goForgotPasswordPage,
            ),
            const SizedBox(height: 32),
            MyButtonWidget(
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
