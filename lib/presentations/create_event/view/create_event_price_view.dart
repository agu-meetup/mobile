import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/create_event_price_text_field_widget.dart';

class CreateEventPriceView extends StatelessWidget {
  const CreateEventPriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PRICE',
                style: TextStyle(
                  fontSize: 12,
                  color: kDarkGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 4),
            CreateEventPriceTextFieldWidget(
              onChangeFunc: mv.changeEventPrice,
            ),
          ],
        );
      },
    );
  }
}
