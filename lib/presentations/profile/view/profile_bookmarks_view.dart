import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_cards/my_event_card_widget.dart';
import '../model_view/profile_model_view.dart';

class ProfileBookmarksView extends StatelessWidget {
  const ProfileBookmarksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModelView>(
      builder: (context, mv, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'My Bookmarks',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ListView.builder(
            itemCount: mv.myBookmarksList.length,
            itemBuilder: (context, index) {
              return MyEventCardWidget(
                eventId: mv.myBookmarksList[index].eventId,
                eventTitle: mv.myBookmarksList[index].eventTitle,
                eventDate: mv.myBookmarksList[index].eventDate,
                eventTime: mv.myBookmarksList[index].eventTime,
                eventPlace: mv.myBookmarksList[index].eventPlace,
                currentMember: mv.myBookmarksList[index].numberCurrentMember,
                maxMember: mv.myBookmarksList[index].numberMaxMember,
                networkImageLink: mv.myBookmarksList[index].firstImagePath,
                iconFunc: mv.removeEventFromMyBookmarks,
                iconImagePath: mv.myBookmarksIconPath,
                eventOnTabFunc: mv.clickEventFunc,
              );
            },
          ),
        );
      },
    );
  }
}
