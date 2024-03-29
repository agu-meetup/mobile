import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MyTextFieldWidget extends StatelessWidget {
  String hintText;
  Function? validatorFunc;
  TextInputType? textInputType;
  bool isPassword;
  bool isSecure;
  Function changeValueFunc;
  Function? changePasswordEye;
  bool isThereShadow;
  TextEditingController? controller;
  bool isActive;
  Function? onTabFunc;
  bool isReadOnly;
  Icon? specificSuffixIcon;
  Icon? specificPrefixIcon;
  bool isEnabled;
  int maxLength;

  MyTextFieldWidget({
    Key? key,
    required this.hintText,
    required this.changeValueFunc,
    this.validatorFunc,
    this.textInputType,
    this.isPassword = false,
    this.isSecure = false,
    this.changePasswordEye,
    this.isThereShadow = true,
    this.controller,
    this.isActive = true,
    this.onTabFunc,
    this.isReadOnly = false,
    this.specificSuffixIcon,
    this.specificPrefixIcon,
    this.isEnabled = true,
    this.maxLength = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (validatorFunc != null) {
          return validatorFunc!(val);
        }
        return null;
      },
      onChanged: (String? val) {
        changeValueFunc(val);
      },
      onTap: () {
        if (onTabFunc != null) {
          onTabFunc!();
        }
      },
      readOnly: isReadOnly,
      keyboardType: textInputType,
      obscureText: isSecure,
      enabled: isEnabled,
      maxLines: maxLength,
      style: TextStyle(
        color: isEnabled ? Colors.black : kDarkGray.withOpacity(0.4),
      ),
      decoration: InputDecoration(
        suffixIcon: specificSuffixIcon ??
            (isPassword
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
                : null),
        prefixIcon: specificPrefixIcon,
        enabledBorder: textFieldBorder(
          isThereShadow ? Colors.transparent : kDarkGray,
        ),
        focusedBorder: textFieldBorder(kNavyBlue),
        errorBorder: textFieldBorder(Colors.red),
        focusedErrorBorder: textFieldBorder(Colors.red),
        disabledBorder: textFieldBorder(kDarkGray.withOpacity(0.4)),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
      ),
    );
  }

  DecoratedInputBorder textFieldBorder(Color borderColor) {
    return DecoratedInputBorder(
      shadow: isThereShadow
          ? [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ]
          : [],
      child: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
    );
  }
}
