import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:control_style/decorated_input_border.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class WidTextFieldWidget extends StatelessWidget {
  String hintText;
  Function? validatorFunc;
  TextInputType? textInputType;
  bool isPassword;
  bool isSecure;
  Function changeValueFunc;
  Function? changePasswordEye;

  WidTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.changeValueFunc,
    this.validatorFunc,
    this.textInputType,
    this.isPassword = false,
    this.isSecure = false,
    this.changePasswordEye,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) {
        if (validatorFunc != null) {
          return validatorFunc!(val);
        }
        return null;
      },
      onChanged: (String? val) {
        changeValueFunc(val);
      },
      keyboardType: textInputType,
      obscureText: isSecure,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  changePasswordEye!(!isSecure!);
                },
                icon: isSecure
                    ? Icon(
                        Icons.visibility_off,
                        color: kNavyBlue,
                      )
                    : Icon(
                        Icons.visibility,
                        color: kNavyBlue,
                      ),
              )
            : null,
        enabledBorder: textFieldBorder(Colors.transparent),
        focusedBorder: textFieldBorder(kNavyBlue),
        errorBorder: textFieldBorder(Colors.red),
        focusedErrorBorder: textFieldBorder(Colors.red),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
      ),
    );
  }

  DecoratedInputBorder textFieldBorder(Color borderColor) {
    return DecoratedInputBorder(
      shadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 8,
          offset: Offset(0, 4),
        )
      ],
      child: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
    );
  }
}
