import 'package:agu_meetup_mobile/presentations/notification/model_view/notification_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notification_card_list_view.dart';


class NotificationView extends StatelessWidget {

  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NotificationModelView>().updateContextData(context);
    return Scaffold(
      body: NotificationCardListView(),
    );
  }
}
