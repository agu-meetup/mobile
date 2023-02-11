import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants.dart';

class ForgotPasswordCodeTextFieldWidget extends StatelessWidget {
  FocusNode focusNode;
  Function changeValFunc;
  bool isFocused;

  ForgotPasswordCodeTextFieldWidget({
    required this.focusNode,
    required this.changeValFunc,
    required this.isFocused,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextFormField(
        focusNode: focusNode,
        textAlign: TextAlign.center,
        onChanged: (val) {
          changeValFunc(val);
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: kOrange,
            ),
          ),
          filled: true,
          fillColor:
              isFocused ? kOrange.withOpacity(0.25) : kGray.withOpacity(0.25),
        ),
      ),
    );
  }
}
