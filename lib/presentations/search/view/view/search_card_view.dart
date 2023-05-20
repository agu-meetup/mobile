import 'package:agu_meetup_mobile/presentations/search/view/widgets/search_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_view/search_model_view.dart';

class SearchCardView extends StatelessWidget {
  const SearchCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModelView>(
      builder: (context, mv, child) {
        return ListView.builder(
          itemCount: mv.cardsInfo.length,
          itemBuilder: (context, index) {
            return SearchCardWidget(
              id: mv.cardsInfo[index].id,
              city: mv.cardsInfo[index].city,
              date: mv.cardsInfo[index].date,
              eventTitle: mv.cardsInfo[index].eventTitle,
              locationName: mv.cardsInfo[index].locationName,
              notificationTitle: mv.cardsInfo[index].notificationTitle,
              time: mv.cardsInfo[index].time,
            );
          },
        );
      },
    );
  }
}
