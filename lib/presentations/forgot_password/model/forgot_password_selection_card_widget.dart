import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../core/size_config.dart';

class ForgotPasswordSelectionCardWidget extends StatelessWidget {
  Function onTapFunc;
  String infoText;
  String type;
  String imagePath;
  bool isSelected;

  ForgotPasswordSelectionCardWidget({
    required this.onTapFunc,
    required this.infoText,
    required this.type,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunc(type);
      },
      child: Container(
        height: SizeConfig.screenHeight! / 6,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? kOrange : kDarkGray,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: SizeConfig.screenHeight! / 12,
              height: SizeConfig.screenHeight! / 12,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenHeight! / 12),
                gradient: LinearGradient(
                  colors: [
                    kOrange.withOpacity(0.4),
                    kOrange.withOpacity(0.04),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(imagePath),
                  height: SizeConfig.screenHeight! / 18,
                  width: SizeConfig.screenHeight! / 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              infoText,
              style: TextStyle(
                fontSize: 16,
                color: kDarkGray,
              ),
            )
          ],
        ),
      ),
    );
  }
}
