import 'package:agu_meetup_mobile/presentations/profile/model_view/profile_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/size_config.dart';

class ProfileGeneralInfoView extends StatelessWidget {
  const ProfileGeneralInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Container(
              width: SizeConfig.screenWidth! / 4,
              height: SizeConfig.screenWidth! / 4,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenWidth! / 4),
                image: const DecorationImage(
                  image: AssetImage("assets/test_image/test_profile_pic.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${mv.userInfo!.name} ${mv.userInfo!.surname}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(
              mv.userInfo!.email,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}
