import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_buttons/my_button_widget.dart';
import '../../../core/constants.dart';

class DetailBottomButtonView extends StatelessWidget {
  const DetailBottomButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            const SizedBox(height: 8),
            mv.isMyEvent
                ? Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: MyButtonWidget(
                            buttonText: 'MEMBERS',
                            buttonTextColor: kWhite,
                            backgroundColor: kOrange,
                            onTapFunction: mv.membersButtonFunc,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: MyButtonWidget(
                          buttonText: 'UPDATE',
                          buttonTextColor: kWhite,
                          backgroundColor: kBeige,
                          onTapFunction: () {},
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: MyButtonWidget(
                          buttonText: 'DELETE',
                          buttonTextColor: kWhite,
                          backgroundColor: Colors.red,
                          onTapFunction: () {},
                        ),
                      )
                    ],
                  )
                : MyButtonWidget(
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
