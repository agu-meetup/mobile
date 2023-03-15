import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

class CreateEventSwitchButtonWidget extends StatelessWidget {
  Function changeSwitchValueFunc;
  bool value;
  String text;
  CreateEventSwitchButtonWidget({
    Key? key,
    required this.changeSwitchValueFunc,
    required this.value,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Switch(
          activeColor: kGreen,
          value: value,
          onChanged: (val) {
            changeSwitchValueFunc(val);
          },
        ),
      ],
    );
  }
}
