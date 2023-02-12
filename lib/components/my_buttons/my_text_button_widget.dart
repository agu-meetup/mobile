import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MyTextButtonWidget extends StatelessWidget {
  String text;
  Function onTanFunc;

  MyTextButtonWidget({
    super.key,
    required this.text,
    required this.onTanFunc,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTanFunc();
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: kNavyBlue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
