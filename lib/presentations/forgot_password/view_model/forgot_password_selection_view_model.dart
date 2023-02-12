import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordSelectionViewModel extends ChangeNotifier {
  String? selectedForgotPasswordWay;
  late BuildContext ctx;

  /// Email selection
  String emailType = "Email";
  String emailInfoText = "via Email";
  String emailIcon = mailRed;

  /// Phone selection
  String phoneType = "Phone";
  String phoneInfoText = "via Phone";
  String phoneIcon = chatRed;

  void changeSelectedWay(String? newWay) {
    selectedForgotPasswordWay = newWay;
    notifyListeners();
  }

  /// Update Context
  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  /// Button Func
  void continueButton() {
    if (selectedForgotPasswordWay == "Email") {
      ctx
          .read<ForgotPasswordViewModel>()
          .updateForgotPasswordWay(selectedForgotPasswordWay);
      ctx.read<ForgotPasswordViewModel>().goNextPage();
      notifyListeners();
    } else if (selectedForgotPasswordWay == "Phone") {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          content: Text('Forgot password service via SMS is not active.')));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text('Please select one of the choices.')));
    }
  }
}
