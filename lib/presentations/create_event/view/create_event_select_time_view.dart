import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventSelectTimeView extends StatelessWidget {
  const CreateEventSelectTimeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'START TIME',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kDarkGray,
                    ),
                  ),
                  const SizedBox(height: 8),
                  MyTextFieldWidget(
                    hintText: 'Select Time',
                    isThereShadow: false,
                    controller: mv.createEventInfoModel.startTimeController,
                    onTabFunc: mv.changeStartTimeValueFunc,
                    isReadOnly: true,
                    changeValueFunc: () {},
                    isEnabled: !mv.createEventInfoModel.isActiveAllDay,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'END TIME',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kDarkGray,
                    ),
                  ),
                  const SizedBox(height: 8),
                  MyTextFieldWidget(
                    hintText: 'Select Time',
                    isThereShadow: false,
                    controller: mv.createEventInfoModel.endTimeController,
                    onTabFunc: mv.changeEndTimeValueFunc,
                    isReadOnly: true,
                    changeValueFunc: () {},
                    isEnabled: !mv.createEventInfoModel.isActiveAllDay,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
