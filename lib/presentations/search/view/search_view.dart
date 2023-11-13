import 'package:agu_meetup_mobile/presentations/home/model_view/home_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_loadings/my_loading_widget.dart';
import '../../../core/constants.dart';
import '../../../core/size_config.dart';
import './view.dart';
import '../model_view/model_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SearchModelView>().updateBuildContext(context);
    context.read<SearchModelView>().initializeMethods();
    return Consumer<SearchModelView>(
      builder: (context, mv, child) {
        if (mv.searchPageStatus == SearchPageStatus.success){
          return SafeArea(
            child: Column(
              children: [
                const SearchTopView(),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          );
        }
        else {
          return Center(
            child: MyLoadingWidget(
              size: SizeConfig.screenWidth! / 4,
              color: kOrange,
            ),
          );
        }

      },
    );
  }
}
