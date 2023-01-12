import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/features/sign_in/view/sign_in_bg_view.dart';
import 'package:agu_meetup_mobile/features/sign_in/view/sign_in_list_component_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: const [
          SignInBgView(),
          SignInListComponentView(),
        ],
      ),
    );
  }
}
