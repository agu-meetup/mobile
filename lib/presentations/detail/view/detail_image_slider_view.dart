import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_carousel/my_carousel_indicator_widget.dart';
import '../../../components/my_carousel/my_carousel_slider_widget.dart';

class DetailImageSliderView extends StatelessWidget {
  const DetailImageSliderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            MyCarouselSliderWidget(
              updateImageIndexFunc: mv.updateImageIndex,
              imageAssetPaths: mv.imagePaths,
              widthOfSlider: SizeConfig.screenWidth!,
            ),
            MyCarouselIndicatorWidget(
              imageIndex: mv.imageIndex,
              lengthOfImages: mv.imagePaths.length,
            ),
          ],
        );
      },
    );
  }
}
