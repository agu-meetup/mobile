import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/profile/view/profile_app_bar_view.dart';
import 'package:agu_meetup_mobile/presentations/profile/view/profile_general_info_view.dart';
import 'package:agu_meetup_mobile/presentations/profile/view/profile_tab_bars_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            ProfileAppBarView(),
            SizedBox(height: 32),
            ProfileGeneralInfoView(),
            SizedBox(height: 32),
            ProfileTabBarsView(),
          ],
        ),
      ),
    );
  }
}

