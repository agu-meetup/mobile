import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_buttons/my_button_widget.dart';
import '../../../core/constants.dart';

class DetailJoinButtonView extends StatelessWidget {
  const DetailJoinButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            const SizedBox(height: 8),
            MyButtonWidget(
              buttonText: 'JOIN',
              buttonTextColor: kWhite,
              backgroundColor: kBeige,
              onTapFunction: () {},
            ),
          ],
        );
      },
    );
  }
}
