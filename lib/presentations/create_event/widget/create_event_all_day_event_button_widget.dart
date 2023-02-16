import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

class CreateEventAllDayEventButtonWidget extends StatelessWidget {
  Function changeSwitchValueFunc;
  bool value;
  CreateEventAllDayEventButtonWidget({
    Key? key,
    required this.changeSwitchValueFunc,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'All Day Event',
          style: TextStyle(
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
