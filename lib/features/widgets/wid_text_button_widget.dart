import 'package:flutter/material.dart';

import '../../core/constants.dart';

class WidTextButtonWidget extends StatelessWidget {
  String text;

  WidTextButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: kNavyBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
