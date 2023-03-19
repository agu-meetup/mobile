import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_buttons/my_button_widget.dart';
import '../../../core/constants.dart';

class CreateEventButtonView extends StatelessWidget {
  const CreateEventButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return MyButtonWidget(
          buttonText: 'Create Event',
          buttonTextColor: kWhite,
          backgroundColor: kBeige,
          onTapFunction: mv.createEventButtonFunc,
        );
      },
    );
  }
}
