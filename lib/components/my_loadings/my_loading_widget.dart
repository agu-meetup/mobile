import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyLoadingWidget extends StatelessWidget {
  double size;
  Color color;

  MyLoadingWidget({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        colors: [color],
        strokeWidth: 2,
      ),
    );
  }
}
