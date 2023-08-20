import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/assets.dart';
import '../../../core/constants.dart';
import '../model_view/model_view.dart';

class SearchFilterButtonWidget extends StatelessWidget {
  const SearchFilterButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModelView>(
      builder: (context, mv, child) {
        return GestureDetector(
          onTap: () {
            mv.filterButtonFunc();
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kPink,
                  kOrange,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image(
                image: AssetImage(filter),
              ),
            ),
          ),
        );
      },
    );
  }
}
