import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../core/constants.dart';
import '../../../core/size_config.dart';

class IntroLoadingWidget extends StatelessWidget {
  const IntroLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: SizeConfig.screenWidth! / 4,
        height: SizeConfig.screenWidth! / 4,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [kWhite],
          strokeWidth: 2,
        ),
      ),
    );
  }
}