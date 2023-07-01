import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:flutter/material.dart';

import '../../../core/assets.dart';

class HomeBackgroundView extends StatelessWidget {
  const HomeBackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Image.asset(homeBg, fit: BoxFit.fitWidth,),
    );
  }
}
