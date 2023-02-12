import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

class CreateEventSelectLocationView extends StatelessWidget {
  const CreateEventSelectLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'CHOOSE LOCATION',
            style: TextStyle(
              color: kDarkGray,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
