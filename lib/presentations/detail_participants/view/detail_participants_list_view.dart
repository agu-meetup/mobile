import 'package:agu_meetup_mobile/presentations/detail_participants/model/detail_participants_card_model.dart';
import 'package:agu_meetup_mobile/presentations/detail_participants/model_view/detail_participants_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../widget/detail_participants_card_widget.dart';

class DetailParticipantsListView extends StatelessWidget {
  const DetailParticipantsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailParticipantsModelView>(
      builder: (context, mv, child) {
        return ListView.builder(
          itemCount: mv.userCardList.length,
          itemBuilder: (context, index) {
            return DetailParticipantsCardWidget(cardModel: mv.userCardList[index],);
          },
        );
      },
    );
  }
}