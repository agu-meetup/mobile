import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class DetailCommentWidget extends StatelessWidget {
  String userPhoto;
  String nameSurname;
  String commentDetail;

  DetailCommentWidget({
    required this.userPhoto,
    required this.nameSurname,
    required this.commentDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPhoto),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "$nameSurname ",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: commentDetail,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kDarkGray,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
