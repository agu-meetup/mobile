import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordMailPhoneViewModel extends ChangeNotifier {
  String? forgotPasswordWay;
  late BuildContext ctx;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void updateForgotPasswordWay(String? newWay) {
    forgotPasswordWay = newWay;
    notifyListeners();
  }

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  /// Email
  String descriptionTitleForEmail = "Please enter your email address to below.";
  String emailHintText = "Email";
  String? emailVal;
  TextInputType emailInputType = TextInputType.emailAddress;
  String? emailValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter valid email";
    }
    if (!EmailValidator.validate(val)) {
      return "Please enter valid email";
    }
    return null;
  }

  void changeEmailVal(String? newEmailVal) {
    emailVal = newEmailVal;
  }

  /// Phone
  String descriptionTitleForPhone = "Please enter your phone number to below.";
  String phoneNumHintText = "Phone number";
  String? phoneNumVal;
  TextInputType phoneNumInputType = TextInputType.number;
  void changePhoneNumVal(String? newPhoneNumVal) {
    phoneNumVal = newPhoneNumVal;
  }

  String? phoneNumValidatorFunc(String? val) {
    if (val == null || val == "") {
      return "Please don't leave blank.";
    }
    return null;
  }

  /// Button
  void continueButtonFunc() {
    if (formKey.currentState!.validate()) {
      if (forgotPasswordWay == "Email") {
        ctx.read<ForgotPasswordViewModel>().updateMailOrPhone(emailVal!);
      } else {
        ctx.read<ForgotPasswordViewModel>().updateMailOrPhone(phoneNumVal!);
      }
      ctx.read<ForgotPasswordViewModel>().goNextPage();
    }
  }
}
