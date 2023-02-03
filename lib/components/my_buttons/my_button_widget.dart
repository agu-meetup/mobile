import 'package:flutter/material.dart';

class MyButtonWidget extends StatelessWidget {
  String buttonText;
  Color buttonTextColor;
  Color backgroundColor;
  double opacityBackground;
  Function onTapFunction;

  MyButtonWidget({
    super.key,
    required this.buttonText,
    required this.buttonTextColor,
    required this.backgroundColor,
    required this.onTapFunction,
    this.opacityBackground = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(opacityBackground),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 18,
              color: buttonTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
