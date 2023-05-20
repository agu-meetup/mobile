import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../../../components/my_textfields/my_text_field_widget.dart';
import '../../../../core/constants.dart';
import '../model_view/search_model_view.dart';

class SearchSelectDateView extends StatelessWidget {
  const SearchSelectDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModelView>(
      builder: (context, mv, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextFieldWidget(
              hintText: 'Select Start Date',
              changeValueFunc: () {},
              isThereShadow: false,
              isReadOnly: true,
            ),
            MyTextFieldWidget(
              hintText: 'Select End Date',
              changeValueFunc: () {},
              isThereShadow: false,
              isReadOnly: true,
            ),
          ],
        );
      },
    );
  }
}
