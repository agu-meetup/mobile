import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/wid_button_widget.dart';
import '../model_view/intro_model_view.dart';

class IntroButtonsWidget extends StatelessWidget {
  const IntroButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IntroModelView introMV = context.read<IntroModelView>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: WidButtonWidget(
            buttonText: introMV.signUpButtonText,
            buttonTextColor: introMV.signUpButtonTextColor,
            backgroundColor: introMV.signUpButtonBackgroundColor,
            onTapFunction: introMV.signUpButton(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: WidButtonWidget(
            buttonText: introMV.loginButtonText,
            buttonTextColor: introMV.loginButtonTextColor,
            backgroundColor: introMV.loginButtonBackgroundColor,
            opacityBackground: introMV.loginButtonOpacity,
            onTapFunction: introMV.loginButton(context),
          ),
        ),
      ],
    );
  }
}
