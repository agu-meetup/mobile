import 'package:flutter/material.dart';

import 'sign_up_bg_view.dart';
import 'sign_up_list_component_view.dart';

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
