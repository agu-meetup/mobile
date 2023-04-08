import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';

class MyCarouselIndicatorWidget extends StatelessWidget {
  int lengthOfImages;
  int imageIndex;

  MyCarouselIndicatorWidget({
    required this.lengthOfImages,
    required this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: lengthOfImages,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 8,
              width: imageIndex == index ? 16 : 8,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:
                    imageIndex == index ? kBeige : kDarkGray.withOpacity(0.4),
              ),
            );
          }),
    );
  }
}
