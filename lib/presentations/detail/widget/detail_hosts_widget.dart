import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class DetailHostsWidget extends StatelessWidget {
  String mainHostImage;
  List<String> hostsMembers;

  DetailHostsWidget({
    required this.mainHostImage,
    required this.hostsMembers,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mainHostImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(36),
          ),
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hosted by:',
              style: TextStyle(
                fontSize: 14,
                color: kDarkGray,
              ),
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: hostsMembers.length,
                itemBuilder: (context, index) {
                  return Text(
                    index == hostsMembers.length - 1
                        ? hostsMembers[index]
                        : "${hostsMembers[index]}, ",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
