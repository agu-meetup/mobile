import 'package:flutter/material.dart';

import '../../../core/size_config.dart';

class ProfileGeneralInfoView extends StatelessWidget {
  const ProfileGeneralInfoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth! / 4,
          height: SizeConfig.screenWidth! / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.screenWidth! / 4),
            image: DecorationImage(
              image: AssetImage("assets/test_image/test_profile_pic.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Kerem Keskin",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        Text(
          "keskinkrm55@gmail.com",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
