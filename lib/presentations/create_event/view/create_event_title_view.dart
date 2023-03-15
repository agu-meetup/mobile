import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_textfields/my_text_field_widget.dart';
import '../../../core/constants.dart';
import '../model_view/create_event_model_view.dart';

class CreateEventTitleView extends StatelessWidget {
  const CreateEventTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'EVENT TITLE',
                style: TextStyle(
                  color: kDarkGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            MyTextFieldWidget(
              hintText: '',
              changeValueFunc: (val) {},
              controller: mv.titleCtr,
              isThereShadow: false,
            ),
          ],
        );
      },
    );
  }
}
