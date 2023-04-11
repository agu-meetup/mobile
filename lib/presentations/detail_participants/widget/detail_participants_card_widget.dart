import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../model/detail_participants_card_model.dart';

class DetailParticipantsCardWidget extends StatelessWidget {
  DetailParticipantsCardModel cardModel;

  DetailParticipantsCardWidget({required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // border: Border.all(color: Colors.black),
        gradient: LinearGradient(
          colors: [Colors.white, kWhite],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: const DecorationImage(
                image: AssetImage("assets/test_image/test_profile_pic.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${cardModel.name} ${cardModel.surname}",
                style:
                const TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                cardModel.email,
                style: TextStyle(
                  color: kDarkGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
