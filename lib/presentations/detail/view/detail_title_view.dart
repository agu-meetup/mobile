import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_view/detail_model_view.dart';

class DetailTitleView extends StatelessWidget {
  const DetailTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            mv.detailInfoModel!.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
