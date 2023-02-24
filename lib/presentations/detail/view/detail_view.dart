import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_app_bar_view.dart';
import 'detail_hosts_and_price_view.dart';
import 'detail_image_slider_view.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBarView(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                DetailImageSliderView(),
                SizedBox(height: 16),
                DetailHostsAndPriceView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
