import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../model_view/profile_model_view.dart';
import '../widget/profile_event_card_widget.dart';

class ProfileTabBarsView extends StatelessWidget {
  const ProfileTabBarsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Consumer<ProfileModelView>(
          builder: (context, mv, child) {
            return Column(
              children: [
                TabBar(
                  indicatorColor: kOrange,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(
                      text: "My Events",
                    ),
                    Tab(
                      text: "Upcoming Events",
                    ),
                    Tab(
                      text: "Past Events",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: mv.myEventsList.length,
                        itemBuilder: (context, index) {
                          return ProfileEventCardWidget(
                            eventId: mv.myEventsList[index].eventId,
                            eventTitle: mv.myEventsList[index].eventTitle,
                            eventDate: mv.myEventsList[index].eventDate,
                            eventTime: mv.myEventsList[index].eventTime,
                            eventPlace: mv.myEventsList[index].eventPlace,
                            currentMember: mv.myEventsList[index].numberCurrentMember,
                            maxMember: mv.myEventsList[index].numberMaxMember,
                            iconFunc: mv.myEventsFunc,
                            iconImagePath: mv.myEventsIconPath,
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: mv.upcomingEventsList.length,
                        itemBuilder: (context, index) {
                          return ProfileEventCardWidget(
                            eventId: mv.upcomingEventsList[index].eventId,
                            eventTitle: mv.upcomingEventsList[index].eventTitle,
                            eventDate: mv.upcomingEventsList[index].eventDate,
                            eventTime: mv.upcomingEventsList[index].eventTime,
                            eventPlace: mv.upcomingEventsList[index].eventPlace,
                            currentMember: mv.upcomingEventsList[index].numberCurrentMember,
                            maxMember: mv.upcomingEventsList[index].numberMaxMember,
                            iconFunc: mv.upcomingEventsFunc,
                            iconImagePath: mv.upcomingEventsIconPath,
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: mv.pastEventsList.length,
                        itemBuilder: (context, index) {
                          return ProfileEventCardWidget(
                            eventId: mv.pastEventsList[index].eventId,
                            eventTitle: mv.pastEventsList[index].eventTitle,
                            eventDate: mv.pastEventsList[index].eventDate,
                            eventTime: mv.pastEventsList[index].eventTime,
                            eventPlace: mv.pastEventsList[index].eventPlace,
                            currentMember: mv.pastEventsList[index].numberCurrentMember,
                            maxMember: mv.pastEventsList[index].numberMaxMember,
                            isClosed: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}