import 'package:agu_meetup_mobile/features/intro/model_view/intro_model_view.dart';
import 'package:agu_meetup_mobile/features/intro/widget/intro_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/intro_buttons_widget.dart';
import '../widget/intro_logo_and_app_name_widget.dart';

class IntroComponentListView extends StatefulWidget {
  const IntroComponentListView({Key? key}) : super(key: key);

  @override
  State<IntroComponentListView> createState() => _IntroComponentListViewState();
}

class _IntroComponentListViewState extends State<IntroComponentListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntroLogoAndAppNameWidget(),
        StreamBuilder<bool>(
          stream: context.read<IntroModelView>().loadingStatus,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return IntroLoadingWidget();
            }
            return IntroButtonsWidget();
          },
        ),
      ],
    );
  }
}
