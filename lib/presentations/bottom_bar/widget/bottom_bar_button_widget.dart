import 'package:flutter/material.dart';

class BottomBarButtonWidget extends StatelessWidget {
  int buttonIndex;
  bool isActive;
  String buttonActive;
  String buttonPassive;
  Function onTabFunc;

  BottomBarButtonWidget({
    required this.buttonIndex,
    required this.isActive,
    required this.buttonActive,
    required this.buttonPassive,
    required this.onTabFunc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabFunc(buttonIndex);
      },
      child: Image(
        image: AssetImage(isActive ? buttonActive : buttonPassive),
        height: 25,
        width: 25,
        fit: BoxFit.cover,
      ),
    );
  }
}
