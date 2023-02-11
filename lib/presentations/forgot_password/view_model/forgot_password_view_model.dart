import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_code_view_model.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'forgot_password_mail_phone_view_model.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  int currentPageIndex = 0;
  String? forgotPasswordWay;
  late BuildContext ctx;
  String? emailOrPhone;

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  void updateForgotPasswordWay(String? newWay) {
    forgotPasswordWay = newWay;
    notifyListeners();
  }

  void backIconButton() {
    if (currentPageIndex != 0) {
      currentPageIndex--;
      if (currentPageIndex == 0) {
        forgotPasswordWay == null;
        ctx.read<ForgotPasswordSelectionViewModel>().changeSelectedWay(null);
      }
      notifyListeners();
    } else {
      Navigator.pop(ctx);
    }
  }

  void updateMailOrPhone(String newEmailOrPhone) {
    emailOrPhone = newEmailOrPhone;
    notifyListeners();
  }

  void goNextPage() {
    currentPageIndex++;
    if (currentPageIndex == 1) {
      ctx
          .read<ForgotPasswordMailPhoneViewModel>()
          .updateForgotPasswordWay(forgotPasswordWay);
    } else if (currentPageIndex == 2) {
      ctx.read<ForgotPasswordCodeViewModel>().updateSentCodeTo(emailOrPhone!);
    }
    notifyListeners();
  }
}
