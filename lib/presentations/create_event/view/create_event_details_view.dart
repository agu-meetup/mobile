import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventDetailsView extends StatelessWidget {
  const CreateEventDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'DETAILS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: kDarkGray,
                ),
              ),
            ),
            const SizedBox(height: 4),
            MyTextFieldWidget(
              hintText: 'Details about event',
              changeValueFunc: (val) {},
              controller: mv.detailCtr,
              isThereShadow: false,
              maxLength: 4,
            ),
          ],
        );
      },
    );
  }
}
