import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/assets.dart';

class CreateEventPriceTextFieldWidget extends StatelessWidget {
  Function onChangeFunc;
  TextEditingController? controller;
  TextInputType textInputType;
  bool isEnabled;

  CreateEventPriceTextFieldWidget({
    required this.onChangeFunc,
    this.controller,
    required this.isEnabled,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 63,
          width: 60,
          decoration: BoxDecoration(
            color: isEnabled ? kBeige : kBeige.withOpacity(0.4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Image(
              image: AssetImage(turkishLira),
              height: 25,
              width: 25,
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            enabled: isEnabled,
            keyboardType: textInputType,
            decoration: InputDecoration(
              enabledBorder: customInputBorder(),
              disabledBorder: customInputBorder(),
              focusedBorder: customInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder customInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
        topLeft: Radius.circular(0),
        bottomLeft: Radius.circular(0),
      ),
      borderSide: BorderSide(
        color: isEnabled ? kDarkGray : kDarkGray.withOpacity(0.4),
      ),
    );
  }
}
