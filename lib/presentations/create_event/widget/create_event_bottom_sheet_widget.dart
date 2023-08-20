import 'package:flutter/material.dart';

import '../../../components/my_buttons/my_text_button_widget.dart';
import '../../../core/constants.dart';

void photoUploadBottomSheet({
  required BuildContext ctx,
  required Function galleryFunc,
  required Function cameraFunc,
}) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: ctx,
    builder: (BuildContext context) {
      return Container(
        height: 150,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyTextButtonWidget(
                text: 'From Gallery',
                onTanFunc: () {
                  galleryFunc();
                },
              ),
              MyTextButtonWidget(
                text: 'From Camera',
                onTanFunc: () {
                  cameraFunc();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
