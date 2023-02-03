import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../model_view/intro_model_view.dart';

class IntroLogoAndAppNameWidget extends StatelessWidget {
  const IntroLogoAndAppNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 2 / 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            context.read<IntroModelView>().logoName,
            style: TextStyle(
              fontSize: 40,
              color: kWhite,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            context.read<IntroModelView>().appName,
            style: TextStyle(
              fontSize: 35,
              color: kWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
