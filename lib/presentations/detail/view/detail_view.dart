import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_app_bar_view.dart';
import 'detail_comment_view.dart';
import 'detail_general_detail_view.dart';
import 'detail_general_info_view.dart';
import 'detail_hosts_and_price_view.dart';
import 'detail_image_slider_view.dart';
import 'detail_join_button_view.dart';
import 'detail_title_view.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBarView(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DetailImageSliderView(),
                  SizedBox(height: 16),
                  DetailHostsAndPriceView(),
                  SizedBox(height: 16),
                  DetailTitleView(),
                  Divider(height: 12, thickness: 1.5),
                  DetailGeneralInfoView(),
                  Divider(height: 12, thickness: 1.5),
                  DetailGeneralDetailView(),
                  Divider(height: 12, thickness: 1.5),
                  DetailCommentView(),
                ],
              ),
            ),
            DetailJoinButtonView(),
          ],
        ),
      ),
    );
  }
}
