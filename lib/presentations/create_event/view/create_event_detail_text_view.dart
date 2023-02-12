import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class CreateEventDetailTextView extends StatelessWidget {
  const CreateEventDetailTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Details',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Add basic details about your event.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: kDarkGray,
            ),
          ),
        ),
      ],
    );
  }
}
