import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/presentations/search/view/model_view/search_model_view.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class SearchTextFieldView extends StatefulWidget {
  const SearchTextFieldView({super.key});

  @override
  State<SearchTextFieldView> createState() => _SearchTextFieldViewState();
}

class _SearchTextFieldViewState extends State<SearchTextFieldView> {
  @override
  Widget build(BuildContext context) {
    context.read<SearchModelView>().updateContextData(context);
    return Consumer<SearchModelView>(
      builder: (context, mv, child) {
        return MyTextFieldWidget(
          hintText: mv.searchHintText,
          changeValueFunc: mv.changeSearchVal,
          isThereShadow: false,
          maxLength: 1,
        );
      },
    );
  }
}
