import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/home/model_view/home_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_loadings/my_loading_widget.dart';
import '../../../core/constants.dart';
import 'home_background_view.dart';
import 'home_going_view.dart';
import 'home_welcome_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<HomeModelView>().updateBuildContext(context);
    context.read<HomeModelView>().inializeMethods();
    return Consumer<HomeModelView>(builder: (context, mv, child) {
      if (!mv.isLoaded) {
        return Scaffold(
          body: Center(
            child: MyLoadingWidget(
                size: SizeConfig.screenWidth! / 4, color: kOrange),
          ),
        );
      }
      else {
        return Scaffold(
          body: Stack(
            children: [
              HomeBackgroundView(),
              Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight! / 12),
                  HomeWelcomeView(),
                  SizedBox(height: SizeConfig.screenHeight! / 12),
                  HomeGoingView(),
                ],
              ),
            ],
          ),
        );
      }
    });
  }
}
