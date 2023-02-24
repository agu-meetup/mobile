import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailGeneralInfoView extends StatelessWidget {
  const DetailGeneralInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      watchGray,
                    ),
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    mv.eventDateInfo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  VerticalDivider(thickness: 1.5, color: kDarkGray),
                  Text(
                    mv.eventTimeInfo,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kDarkGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      pinGray,
                    ),
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    mv.eventPlaceInfo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  VerticalDivider(thickness: 1.5, color: kDarkGray),
                  Text(
                    mv.eventCityInfo,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kDarkGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      userGray,
                    ),
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${mv.eventMembersInfo} people are going",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
