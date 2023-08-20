
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/my_textfields/my_text_field_widget.dart';
import '../../../core/constants.dart';
import '../widget/widget.dart';

class SearchTopView extends StatelessWidget {
  const SearchTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: MyTextFieldWidget(
              specificPrefixIcon: const Icon(
                Icons.search,
              ),
              isThereShadow: false,
              hintText: "Search event..",
              changeValueFunc: (val) {},
            ),
          ),
          const SizedBox(width: 8),
          const SearchFilterButtonWidget(),
        ],
      ),
    );
  }
}
