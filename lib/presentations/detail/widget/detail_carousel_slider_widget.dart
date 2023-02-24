import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/size_config.dart';
import '../model_view/detail_model_view.dart';

class DetailCarouselSliderWidget extends StatelessWidget {
  Function updateImageIndexFunc;
  List<String> imagePaths;

  DetailCarouselSliderWidget({
    required this.updateImageIndexFunc,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
          // height: SizeConfig.screenHeight! / 4,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            updateImageIndexFunc(index);
          }),
      itemCount: imagePaths.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          // height: SizeConfig.screenHeight! / 4 - 36,
          margin: const EdgeInsets.all(12),
          width: SizeConfig.screenWidth!,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePaths[index]),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                color: kDarkGray,
                blurRadius: 4,
              ),
            ],
          ),
        );
      },
    );
  }
}
