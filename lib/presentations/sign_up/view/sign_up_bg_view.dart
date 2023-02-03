import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import '../../../../core/size_config.dart';

class SignUpBgView extends StatelessWidget {
  const SignUpBgView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                // width: SizeConfig.screenWidth,
                child: Image.asset(
                  signInUpBg2,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
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
