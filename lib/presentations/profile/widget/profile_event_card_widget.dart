import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

class ProfileEventCardWidget extends StatelessWidget {
  int eventId;
  String eventDate;
  String eventTime;
  String eventPlace;
  String eventTitle;
  int currentMember;
  int maxMember;
  Function? iconFunc;
  String? iconImagePath;
  bool isClosed;

  ProfileEventCardWidget({
    required this.eventId,
    required this.eventDate,
    required this.eventTime,
    required this.eventPlace,
    required this.eventTitle,
    required this.currentMember,
    required this.maxMember,
    this.iconFunc,
    this.iconImagePath,
    this.isClosed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(5),
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
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/test_image/test_cinema.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isClosed == false
                            ? Row(
                                children: [
                                  Text(
                                    eventDate,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    eventTime,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: kBeige,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "Closed",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: kBeige,
                                ),
                              ),
                        Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: kOrange,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              eventPlace,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: kDarkGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    iconImagePath != null
                        ? GestureDetector(
                            onTap: () {
                              iconFunc!(eventId);
                            },
                            child: Image(
                              image: AssetImage(iconImagePath!),
                            ),
                          )
                        : Container(),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    eventTitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Image(
                      image: AssetImage(eventMembers),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "$currentMember / $maxMember",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
