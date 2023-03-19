import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../../core/constants.dart';
import '../../core/size_config.dart';

Future<void> mySimpleDialogWidget({
  required BuildContext context,
  required String title,
  required String description,
  required String imagePath,
}) async {
  late Timer timer;
  await showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        timer = Timer(const Duration(seconds: 4), () {
          Navigator.of(builderContext).pop();
        });

        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            width: SizeConfig.screenWidth! * 2 / 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage(imagePath),
                  height: SizeConfig.screenWidth! / 4,
                  width: SizeConfig.screenWidth! / 4,
                  fit: BoxFit.cover,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: kDarkGray,
                  ),
                ),
              ],
            ),
          ),
        );
      }).then((val) {
    if (timer.isActive) {
      timer.cancel();
    }
  });
}
