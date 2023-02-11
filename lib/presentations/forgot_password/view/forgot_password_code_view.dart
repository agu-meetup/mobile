import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_code_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../widget/forgot_password_code_text_field_widget.dart';

class ForgotPasswordCodeView extends StatelessWidget {
  const ForgotPasswordCodeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ForgotPasswordCodeViewModel>().startFocusListener();
    context.read<ForgotPasswordCodeViewModel>().updateBuildContext(context);
    return Consumer<ForgotPasswordCodeViewModel>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Text(
              'Code has been sent to ${mv.sentCodeTo}',
              overflow: TextOverflow.ellipsis,
              maxLines: 20,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kDarkGray,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ForgotPasswordCodeTextFieldWidget(
                  focusNode: mv.focusNode1,
                  changeValFunc: mv.changeCode1,
                  isFocused: mv.isCode1Focused,
                ),
                ForgotPasswordCodeTextFieldWidget(
                  focusNode: mv.focusNode2,
                  changeValFunc: mv.changeCode2,
                  isFocused: mv.isCode2Focused,
                ),
                ForgotPasswordCodeTextFieldWidget(
                  focusNode: mv.focusNode3,
                  changeValFunc: mv.changeCode3,
                  isFocused: mv.isCode3Focused,
                ),
                ForgotPasswordCodeTextFieldWidget(
                  focusNode: mv.focusNode4,
                  changeValFunc: mv.changeCode4,
                  isFocused: mv.isCode4Focused,
                ),
              ],
            ),
            const Spacer(),
            MyButtonWidget(
              buttonText: 'Verify',
              buttonTextColor: kWhite,
              backgroundColor: kNavyBlue,
              onTapFunction: mv.verifyButtonFunc,
            ),
          ],
        );
      },
    );
  }
}
