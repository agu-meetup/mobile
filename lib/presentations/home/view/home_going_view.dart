import 'package:agu_meetup_mobile/components/my_cards/my_event_card_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/home/model_view/home_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeGoingView extends StatelessWidget {
  const HomeGoingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModelView>(
      builder: (context, mv, child) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'You\'re going',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => kDarkGray),
                      ),
                      onPressed: mv.changeSeeAllGoingEvent,
                      child: mv.goingEventList.length > 2
                          ? !mv.isSeeAllGoingEventList
                              ? const Text(
                                  'See all',
                                )
                              : const Text(
                                  'See less',
                                )
                          : Container(),
                    ),
                  ],
                ),
                !mv.isSeeAllGoingEventList
                    ? Column(
                        children: mv.goingEventList.length <= 2
                            ? [
                                ...mv.goingEventList.map((e) {
                                  return MyEventCardWidget(
                                    eventId: e.eventId,
                                    eventDate: e.eventDate,
                                    eventTime: e.eventTime,
                                    eventPlace: e.eventPlace,
                                    eventTitle: e.eventTitle,
                                    currentMember: e.currentMember,
                                    maxMember: e.maxMember,
                                    networkImageLink: e.firstImage,
                                    eventOnTabFunc: mv.clickEvent,
                                  );
                                }).toList(),
                              ]
                            : [
                                ...mv.goingEventList.sublist(0, 2).map((e) {
                                  return MyEventCardWidget(
                                    eventId: e.eventId,
                                    eventDate: e.eventDate,
                                    eventTime: e.eventTime,
                                    eventPlace: e.eventPlace,
                                    eventTitle: e.eventTitle,
                                    currentMember: e.currentMember,
                                    maxMember: e.maxMember,
                                    networkImageLink: e.firstImage,
                                    eventOnTabFunc: mv.clickEvent,
                                  );
                                }).toList(),
                              ],
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: mv.goingEventList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return MyEventCardWidget(
                              eventId: mv.goingEventList[index].eventId,
                              eventDate: mv.goingEventList[index].eventDate,
                              eventTime: mv.goingEventList[index].eventTime,
                              eventPlace: mv.goingEventList[index].eventPlace,
                              eventTitle: mv.goingEventList[index].eventTitle,
                              currentMember:
                                  mv.goingEventList[index].currentMember,
                              maxMember: mv.goingEventList[index].maxMember,
                              networkImageLink:
                                  mv.goingEventList[index].firstImage,
                              eventOnTabFunc: mv.clickEvent,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
