import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_mail_phone_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordMailPhoneView extends StatelessWidget {
  const ForgotPasswordMailPhoneView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<ForgotPasswordMailPhoneViewModel>()
        .updateBuildContext(context);
    return Consumer<ForgotPasswordMailPhoneViewModel>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Text(
              mv.forgotPasswordWay == "Email"
                  ? mv.descriptionTitleForEmail
                  : mv.descriptionTitleForPhone,
              style: TextStyle(
                fontSize: 16,
                color: kDarkGray,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: mv.formKey,
              child: MyTextFieldWidget(
                hintText: mv.forgotPasswordWay == "Email"
                    ? mv.emailHintText
                    : mv.phoneNumHintText,
                changeValueFunc: mv.forgotPasswordWay == "Email"
                    ? mv.changeEmailVal
                    : mv.changePhoneNumVal,
                textInputType: mv.forgotPasswordWay == "Email"
                    ? mv.emailInputType
                    : mv.phoneNumInputType,
                validatorFunc: mv.forgotPasswordWay == "Email"
                    ? mv.emailValidatorFunc
                    : mv.phoneNumValidatorFunc,
              ),
            ),
            const Spacer(),
            MyButtonWidget(
              buttonText: 'Continue',
              buttonTextColor: kWhite,
              backgroundColor: kNavyBlue,
              onTapFunction: mv.continueButtonFunc,
            ),
          ],
        );
      },
    );
  }
}
