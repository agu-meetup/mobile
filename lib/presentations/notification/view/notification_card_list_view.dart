import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/notification/model_view/notification_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/notification_card_widget.dart';

class NotificationCardListView extends StatelessWidget {
  const NotificationCardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationModelView>(builder: (context, mv, child) {
      return ListView.builder(
        itemCount: mv.cardsInfo.length,
        itemBuilder: (context, index) {
          return NotificationCardWidget(
            id: mv.cardsInfo[index]!.id,
            city: mv.cardsInfo[index]!.city,
            date: mv.cardsInfo[index]!.date,
            eventTitle: mv.cardsInfo[index]!.eventTitle,
            locationName: mv.cardsInfo[index]!.locationName,
            notificationTitle: mv.cardsInfo[index]!.notificationTitle,
            time: mv.cardsInfo[index]!.time,
            deleteFunc: mv.deleteNotificationById,
          );
        },
      );
    },);
  }
}