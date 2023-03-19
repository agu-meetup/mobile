import 'package:agu_meetup_mobile/components/my_dropdowns/my_dropdown_widget.dart';
import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventQuotaAndGenderView extends StatelessWidget {
  const CreateEventQuotaAndGenderView({
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
                    'QUOTA',
                    style: TextStyle(
                      fontSize: 12,
                      color: kDarkGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyTextFieldWidget(
                    hintText: '',
                    changeValueFunc: (val) {},
                    controller: mv.quotaCtr,
                    textInputType: mv.quotaInputType,
                    isThereShadow: false,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GENDER',
                    style: TextStyle(
                      fontSize: 12,
                      color: kDarkGray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MyDropdownWidget(
                    dropdownValue: mv.genderDropdownValue,
                    elementList: mv.genderList,
                    onChangedFunc: mv.changeSelectedGender,
                    isThereShadow: false,
                    hintText: "Gender",
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
