import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../../core/size_config.dart';
import '../../../core/constants.dart';
import '../../widgets/wid_button_widget.dart';
import 'package:provider/provider.dart';

import '../model_view/intro_model_view.dart';
import 'intro_component_list_view.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kPink,
              kOrange,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const IntroComponentListView(),
      ),
    );
  }
}
