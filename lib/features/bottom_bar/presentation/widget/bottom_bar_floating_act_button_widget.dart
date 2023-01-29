import 'package:flutter/material.dart';

import '../../../../core/assets.dart';

class BottomBarFloatingActButtonWidget extends StatelessWidget {
  Function onTabFunc;

  BottomBarFloatingActButtonWidget({required this.onTabFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118,
      width: 72,
      child: Column(
        children: [
          SizedBox(
            height: 54,
          ),
          GestureDetector(
            onTap: () {
              onTabFunc(2);
            },
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(addButton),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
