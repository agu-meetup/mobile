import 'package:flutter/material.dart';

import 'sign_in_bg_view.dart';
import 'sign_in_list_component_view.dart';

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
