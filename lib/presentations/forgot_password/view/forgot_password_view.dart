import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'forgot_password_code_view.dart';
import 'forgot_password_mail_phone_view.dart';
import 'forgot_password_selection_view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ForgotPasswordViewModel>().updateBuildContext(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            context.read<ForgotPasswordViewModel>().backIconButton();
          },
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<ForgotPasswordViewModel>(
          builder: (context, mv, child) {
            if (mv.currentPageIndex == 0) {
              return ForgotPasswordSelectionView();
            } else if (mv.currentPageIndex == 1) {
              return ForgotPasswordMailPhoneView();
            } else if (mv.currentPageIndex == 2) {
              return ForgotPasswordCodeView();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
