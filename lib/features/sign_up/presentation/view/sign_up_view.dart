import 'package:agu_meetup_mobile/features/sign_up/presentation/view/sign_up_bg_view.dart';
import 'package:agu_meetup_mobile/features/sign_up/presentation/view/sign_up_list_component_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: const [
          SignUpBgView(),
          SignUpListComponentView(),
        ],
      ),
    );
  }
}
