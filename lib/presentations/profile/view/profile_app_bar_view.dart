import 'package:flutter/material.dart';

import '../../../core/assets.dart';
import '../../../core/constants.dart';

class ProfileAppBarView extends StatelessWidget {
  const ProfileAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage(saveBeige),
            ),
          ),
        ),
        const Text(
          "Profile",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Edit Profile",
            style: TextStyle(
              fontSize: 12,
              color: kBeige,
            ),
          ),
        ),
      ],
    );
  }
}
