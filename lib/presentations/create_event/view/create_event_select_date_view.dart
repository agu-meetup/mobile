import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_textfields/my_text_field_widget.dart';
import '../widget/create_event_all_day_event_button_widget.dart';

class CreateEventSelectDateView extends StatelessWidget {
  const CreateEventSelectDateView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'DATE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kDarkGray,
                  ),
                ),
                const Spacer(),
                CreateEventAllDayEventButtonWidget(
                  changeSwitchValueFunc: mv.changeActiveAllDayValue,
                  value: mv.isActiveAllDay,
                ),
              ],
            ),
            MyTextFieldWidget(
              hintText: 'Select Date',
              changeValueFunc: () {},
              isThereShadow: false,
              controller: mv.dateSelectorController,
              onTabFunc: mv.changeDateValueFunc,
              isReadOnly: true,
              specificSuffixIcon: mv.dateIcon,
            ),
          ],
        );
      },
    );
  }
}
