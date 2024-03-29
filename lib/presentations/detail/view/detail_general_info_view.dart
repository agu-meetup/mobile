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
                    mv.detailInfoModel!.eventDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  VerticalDivider(thickness: 1.5, color: kDarkGray),
                  Text(
                    "${mv.detailInfoModel!.startTime} - ${mv.detailInfoModel!.endTime}",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            mv.detailInfoModel!.locationName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          VerticalDivider(thickness: 1.5, color: kDarkGray),
                          Text(
                            "${mv.detailInfoModel!.district}, ${mv.detailInfoModel!.province}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kDarkGray,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      GestureDetector(
                        onTap: () {
                          mv.openMapButton();
                        },
                        child: Text(
                          'Open Map',
                          style: TextStyle(
                            fontSize: 14,
                            color: kBeige,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              mv.detailInfoModel!.forDirection != "" ? Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.directions,
                        color: kGray,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        mv.detailInfoModel!.forDirection,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ) : Container(),
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
                    "${mv.detailInfoModel!.currentParticipants} / ${mv.detailInfoModel!.maxParticipants} people are going",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      allGender,
                    ),
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    mv.detailInfoModel!.gender,
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
