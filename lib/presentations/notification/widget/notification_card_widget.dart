import 'package:flutter/material.dart';

import '../../../core/assets.dart';
import '../../../core/constants.dart';

class NotificationCardWidget extends StatelessWidget {
  int id;
  String notificationTitle;
  String eventTitle;
  String date;
  String time;
  String locationName;
  String city;
  Function deleteFunc;

  NotificationCardWidget({
    required this.id,
    required this.notificationTitle,
    required this.eventTitle,
    required this.date,
    required this.time,
    required this.locationName,
    required this.city,
    required this.deleteFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: EdgeInsets.all(5),
      height: 100,
      decoration: BoxDecoration(
        color: kGray.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/test_image/test_cinema.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificationTitle,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  eventTitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: kBeige,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      locationName,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      city,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: kDarkGray,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        deleteFunc(id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage(trash),
                          height: 18,
                          width: 18,
                          fit: BoxFit.cover,
                        ),
                      ),
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
