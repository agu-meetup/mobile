import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_change_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordChangeView extends StatelessWidget {
  const ForgotPasswordChangeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ForgotPasswordChangeViewModel>().updateBuildContext(context);
    return Consumer<ForgotPasswordChangeViewModel>(
      builder: (context, mv, child) {
        return Form(
          key: mv.formKey,
          child: Column(
            children: [
              const Text(
                'Create your new password',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              MyTextFieldWidget(
                hintText: mv.passwordHintText,
                changeValueFunc: mv.changePasswordVal,
                validatorFunc: mv.passwordValidatorFunc,
                isPassword: true,
                isSecure: mv.passwordIsEyeOpen,
                changePasswordEye: mv.changePasswordEye,
              ),
              const SizedBox(height: 20),
              MyTextFieldWidget(
                hintText: mv.passwordAgainHintText,
                changeValueFunc: mv.changePasswordAgainVal,
                validatorFunc: mv.passwordAgainValidatorFunc,
                isPassword: true,
                isSecure: mv.passwordAgainIsEyeOpen,
                changePasswordEye: mv.changePasswordAgainEye,
              ),
              const Spacer(),
              MyButtonWidget(
                buttonText: 'Continue',
                buttonTextColor: kWhite,
                backgroundColor: kNavyBlue,
                onTapFunction: mv.continueButtonFunc,
              ),
            ],
          ),
        );
      },
    );
  }
}
