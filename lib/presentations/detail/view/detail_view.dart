import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/detail_app_bar_widget.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBarWidget(),
    );
  }
}
