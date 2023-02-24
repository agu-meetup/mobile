import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/detail_hosts_widget.dart';
import '../widget/detail_price_widget.dart';

class DetailHostsAndPriceView extends StatelessWidget {
  const DetailHostsAndPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Row(
          children: [
            DetailHostsWidget(
              hostsMembers: mv.hostsMembers,
              mainHostImage: mv.mainHostImage,
            ),
            const Spacer(),
            DetailPriceWidget(price: mv.price),
          ],
        );
      },
    );
  }
}
