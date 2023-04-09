import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class MyCarouselSliderWidget extends StatelessWidget {
  Function updateImageIndexFunc;
  List<String>? imageNetworkPaths;
  List<String>? imageFilePaths;
  double widthOfSlider;

  MyCarouselSliderWidget({
    required this.updateImageIndexFunc,
    this.imageNetworkPaths,
    this.imageFilePaths,
    required this.widthOfSlider,
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
      itemCount: imageNetworkPaths != null ? imageNetworkPaths!.length : imageFilePaths!.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          // height: SizeConfig.screenHeight! / 4 - 36,
          margin: const EdgeInsets.all(12),
          width: widthOfSlider,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: imageNetworkPaths != null ? DecorationImage(
              image: NetworkImage(imageNetworkPaths![index]),
              fit: BoxFit.cover,
            ) : DecorationImage(
              image: FileImage(File(imageFilePaths![index])),
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
