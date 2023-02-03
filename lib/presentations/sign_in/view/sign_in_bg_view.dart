import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import '../../../../core/size_config.dart';

class SignInBgView extends StatelessWidget {
  const SignInBgView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      child: Column(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth,
            child: Image.asset(
              signInUpBg1,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth,
            child: Image.asset(
              signInUpBg3,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
