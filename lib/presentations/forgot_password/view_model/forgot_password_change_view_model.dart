import 'package:agu_meetup_mobile/components/my_dialogs/my_simple_dialog_widget.dart';
import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/domains/forgot_password/repository/forgot_password_repository.dart';
import 'package:agu_meetup_mobile/presentations/sign_in/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordChangeViewModel extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late BuildContext ctx;
  ForgotPasswordRepository forgotPasswordRepository = ForgotPasswordRepository();

  /// Password Properties
  String passwordHintText = "Password";
  String? passwordVal;
  bool passwordIsEyeOpen = true;

  void updateBuildContext(BuildContext context){
    ctx = context;
  }

  void changePasswordVal(String? newPasswordVal) {
    passwordVal = newPasswordVal;
  }

  String? passwordValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter password more 6 character";
    }
    if (val.length < 6) {
      return "Please enter password more 6 character";
    }
    return null;
  }

  void changePasswordEye(bool newEyeOpen) {
    passwordIsEyeOpen = newEyeOpen;
    notifyListeners();
  }

  /// Password Again Properties
  String passwordAgainHintText = "Password Again";
  String? passwordAgainVal;
  bool passwordAgainIsEyeOpen = true;

  void changePasswordAgainVal(String? newPasswordAgainVal) {
    passwordAgainVal = newPasswordAgainVal;
  }

  String? passwordAgainValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter password more 6 character";
    }
    if (val.length < 6) {
      return "Please enter password more 6 character";
    }
    if (passwordVal != passwordAgainVal) {
      return "Please enter same password";
    }
    return null;
  }

  void changePasswordAgainEye(bool newEyeOpen) {
    passwordAgainIsEyeOpen = newEyeOpen;
    notifyListeners();
  }

  /// Continue button
  void continueButtonFunc() async{
    if (formKey.currentState!.validate()) {
      try {
        await forgotPasswordRepository.resetPassword(newPassword: passwordVal!);
        await mySimpleDialogWidget(context: ctx, title: "Success", description: "Your password changed successfully. Please try to login.", imagePath: successStar);
        Navigator.pushAndRemoveUntil(ctx, MaterialPageRoute(builder: (_) => SignInView()), (route) => false);
      } catch (e) {
        await mySimpleDialogWidget(context: ctx, title: "Error", description: "An error occured when changing your password", imagePath: errorRedCross);
      }
    }
  }
}
