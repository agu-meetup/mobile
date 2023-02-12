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
  // no arguments...
  @override
  Widget build(BuildContext context) {
    context.read<SignInModelView>().updateContextData(context);
    return Consumer<SignInModelView>(builder: (context, mv, child) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: mv.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SignInTextsWidget(),
              const SizedBox(height: 16),
              MyTextFieldWidget(
                hintText: mv.emailHintText,
                changeValueFunc: mv.changeEmailVal,
                validatorFunc: mv.emailValidatorFunc,
                textInputType: mv.emailTextInputType,
              ),
              const SizedBox(height: 16),
              MyTextFieldWidget(
                hintText: "Password",
                changeValueFunc: mv.changePasswordVal,
                validatorFunc: mv.passwordValidatorFunc,
                isPassword: true,
                isSecure: mv.isEyeOpen,
                changePasswordEye: mv.changePasswordEye,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: MyTextButtonWidget(
                  text: "Forgot Password?",
                  onTanFunc: mv.goForgotPasswordPage,
                ),
              ),
              const SizedBox(height: 32),
              MyButtonWidget(
                buttonText: "Sign In",
                buttonTextColor: kWhite,
                backgroundColor: kNavyBlue,
                onTapFunction: mv.signInButtonFunc,
              ),
              SignInSignUpButtonWidget(),
            ],
          ),
        ),
      );
    });
  }
}
