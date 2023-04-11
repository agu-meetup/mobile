import 'package:agu_meetup_mobile/components/my_loadings/my_loading_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/detail_participants/model_view/detail_participants_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_participants_list_view.dart';

class DetailParticipantsView extends StatelessWidget {
  const DetailParticipantsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DetailParticipantsModelView>().updateBuildContext(context);
    context.read<DetailParticipantsModelView>().initializeMethods();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event Participants",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<DetailParticipantsModelView>(
        builder: (context, mv, child) {
          if (!mv.isPageLoaded) {
            return Center(
              child: MyLoadingWidget(
                size: SizeConfig.screenWidth! / 4,
                color: kOrange,
              ),
            );
          }
          return DetailParticipantsListView();
        },
      ),
    );
  }
}
