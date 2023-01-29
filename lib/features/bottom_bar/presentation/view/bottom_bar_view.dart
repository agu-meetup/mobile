import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/features/create_event/presentation/view/create_event_view.dart';
import 'package:agu_meetup_mobile/features/home/presentation/view/home_view.dart';
import 'package:agu_meetup_mobile/features/notification/presentation/view/notification_view.dart';
import 'package:agu_meetup_mobile/features/profile/presentation/view/profile_view.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../search/presentation/view/search_view.dart';
import '../model_view/bottom_bar_model_view.dart';
import '../widget/bottom_bar_button_widget.dart';
import '../widget/bottom_bar_floating_act_button_widget.dart';

class BottomBarView extends StatelessWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarMV = context.read<BottomBarModelView>();
    return StreamBuilder<int>(
      stream: bottomBarMV.loadingStatus,
      builder: (context, snapshot) {
        return Scaffold(
          body: changingPage(snapshot.data),
          floatingActionButton: BottomBarFloatingActButtonWidget(
            onTabFunc: bottomBarMV.changeBarIndex,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BottomBarButtonWidget(
                    buttonActive: bottomBarMV.homeButtonActiveIcon,
                    buttonPassive: bottomBarMV.homeButtonPassiveIcon,
                    buttonIndex: 0,
                    isActive: snapshot.data == 0 ? true : false,
                    onTabFunc: bottomBarMV.changeBarIndex,
                  ),
                  BottomBarButtonWidget(
                    buttonActive: bottomBarMV.searchButtonActiveIcon,
                    buttonPassive: bottomBarMV.searchButtonPassiveIcon,
                    buttonIndex: 1,
                    isActive: snapshot.data == 1 ? true : false,
                    onTabFunc: bottomBarMV.changeBarIndex,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  BottomBarButtonWidget(
                    buttonActive: bottomBarMV.notificationButtonActiveIcon,
                    buttonPassive: bottomBarMV.notificationButtonPassiveIcon,
                    buttonIndex: 3,
                    isActive: snapshot.data == 3 ? true : false,
                    onTabFunc: bottomBarMV.changeBarIndex,
                  ),
                  BottomBarButtonWidget(
                    buttonActive: bottomBarMV.profileButtonActiveIcon,
                    buttonPassive: bottomBarMV.profileButtonPassiveIcon,
                    buttonIndex: 4,
                    isActive: snapshot.data == 4 ? true : false,
                    onTabFunc: bottomBarMV.changeBarIndex,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget changingPage(int? index) {
    switch (index) {
      case 0:
      case null:
        return HomeView();
      case 1:
        return SearchView();
      case 2:
        return CreateEventView();
      case 3:
        return NotificationView();
      case 4:
        return ProfileView();
      default:
        return HomeView();
    }
  }
}
