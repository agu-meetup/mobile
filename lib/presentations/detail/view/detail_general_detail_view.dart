import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailGeneralDetailView extends StatelessWidget {
  const DetailGeneralDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Details',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(mv.detailTextInfo),
            SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
