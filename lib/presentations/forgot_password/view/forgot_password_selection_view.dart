import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_selection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/assets.dart';
import '../../../core/constants.dart';
import '../../../core/size_config.dart';
import '../model/forgot_password_selection_card_widget.dart';

class ForgotPasswordSelectionView extends StatelessWidget {
  const ForgotPasswordSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select with contact details should we use to reset password',
          overflow: TextOverflow.ellipsis,
          maxLines: 20,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: kDarkGray,
          ),
        ),
        const SizedBox(height: 20),
        Consumer<ForgotPasswordSelectionViewModel>(
          builder: (context, mv, child) {
            return Column(
              children: [
                ForgotPasswordSelectionCardWidget(
                  type: mv.emailType,
                  infoText: mv.emailInfoText,
                  onTapFunc: mv.changeSelectedWay,
                  imagePath: mv.emailIcon,
                  isSelected: mv.selectedForgotPasswordWay == "Email",
                ),
                const SizedBox(height: 12),
                ForgotPasswordSelectionCardWidget(
                  onTapFunc: mv.changeSelectedWay,
                  infoText: mv.phoneInfoText,
                  type: mv.phoneType,
                  imagePath: mv.phoneIcon,
                  isSelected: mv.selectedForgotPasswordWay == "Phone",
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
