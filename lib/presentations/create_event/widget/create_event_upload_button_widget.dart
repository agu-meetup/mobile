import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../core/assets.dart';
import '../../../core/constants.dart';

class CreateEventUploadButtonWidget extends StatelessWidget {
  Function onTabFunc;

  CreateEventUploadButtonWidget({required this.onTabFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabFunc();
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: kDarkGray,
        radius: const Radius.circular(12),
        child: Container(
          height: 90,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  height: 25,
                  width: 25,
                  image: AssetImage(upload),
                ),
                Text(
                  'Upload',
                  style: TextStyle(
                    color: kDarkGray,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
