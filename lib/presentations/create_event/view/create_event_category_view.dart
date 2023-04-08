import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_dropdowns/my_dropdown_widget.dart';
import '../../../core/constants.dart';

class CreateEventCategoryView extends StatelessWidget {
  const CreateEventCategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'CATEGORY',
                style: TextStyle(
                  fontSize: 12,
                  color: kDarkGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 4),
            MyDropdownWidget(
              dropdownValue: mv.createEventInfoModel.categoryDropdownValue,
              elementList: mv.categoryList,
              onChangedFunc: mv.changeSelectedCategory,
              isThereShadow: false,
              hintText: "Category",
            ),
          ],
        );
      },
    );
  }
}
