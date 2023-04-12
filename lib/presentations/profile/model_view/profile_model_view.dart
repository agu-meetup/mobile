import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/data/user/models/get_user_info_response_model.dart';
import 'package:agu_meetup_mobile/data/user/models/update_user_info_request.dart';
import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/domains/profile/repository/profile_repository.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';
import 'package:agu_meetup_mobile/presentations/authentication/view/authentication_view.dart';
import 'package:agu_meetup_mobile/presentations/authentication/view_model/authentication_model_view.dart';
import 'package:agu_meetup_mobile/presentations/profile/view/profile_edit_view.dart';
import 'package:flutter/material.dart';

import '../../../components/my_dialogs/my_simple_dialog_widget.dart';
import '../../detail/view/detail_view.dart';
import '../model/profile_event_model.dart';

enum ProfilePageStatus {
  loading,
  success,
  failed,
}

class ProfileModelView extends ChangeNotifier {
  BuildContext? ctx;

  /// Attributes
  GetUserInfoResponseModel? userInfo;
  ProfilePageStatus profilePageStatus = ProfilePageStatus.loading;

  /// Domain Layers
  UserRepository userRepository = UserRepository();
  EventRepository eventRepository = EventRepository();
  ProfileRepository profileRepository = ProfileRepository();

  /// Other Model Views
  AuthenticationModelView authenticationModelView = AuthenticationModelView();

  /// Update Context data
  void updateContextData(BuildContext context) {
    ctx = context;
  }

  void initializeMethods() async {
    getUserInfoFromDomain();
    await getAllEventsListFromRepository();
    profilePageStatus = ProfilePageStatus.success;
    notifyListeners();
  }

  void getUserInfoFromDomain() {
    userInfo = userRepository.getUserInfo();
  }

  Future<void> getAllEventsListFromRepository() async {
    myEventsList = [];
    upcomingEventsList = [];
    pastEventsList = [];
    myBookmarksList = [];

    myEventsList = await profileRepository.getProfileMyEventList(userInfo!.id);
    upcomingEventsList =
        await profileRepository.getUpcomingEventList(userInfo!.id);
    pastEventsList = await profileRepository.getPastEventList(userInfo!.id);
    myBookmarksList = await profileRepository.getProfileBookmarksEventList();

    notifyListeners();
  }

  /// Dummy Values
  List<ProfileEventModel> myEventsList = [];
  List<ProfileEventModel> upcomingEventsList = [];
  List<ProfileEventModel> pastEventsList = [];
  List<ProfileEventModel> myBookmarksList = [];

  /// ClickEventFunction
  void clickEventFunc(int eventId) {
    eventRepository.eventDetailPageClicked(eventId);
    Navigator.push(ctx!, MaterialPageRoute(builder: (_) => const DetailView()))
        .then((value) async {
      profilePageStatus = ProfilePageStatus.loading;
      notifyListeners();
      myBookmarksList = await profileRepository.getProfileBookmarksEventList();
      profilePageStatus = ProfilePageStatus.success;
      notifyListeners();
    });
  }

  /// My Events
  String myEventsIconPath = circularMore;
  void myEventsFunc(int eventId) {
    print("$eventId does something");
  }

  /// Upcoming Events
  String upcomingEventsIconPath = closeRed;
  void upcomingEventsFunc(int eventId) {
    upcomingEventsList.removeWhere((element) => element.eventId == eventId);
    notifyListeners();
  }

  /// Action Buttons
  void editActionButtonFunc() {
    Navigator.push(
        ctx!, MaterialPageRoute(builder: (context) => ProfileEditView()));
  }

  void logoutActionButtonFunc() async {
    await authenticationModelView.logout();
    Navigator.push(ctx!,
        MaterialPageRoute(builder: (context) => const AuthenticationView()));
  }

  /// Edit Profile Page
  BuildContext? ctxEditPage;

  TextEditingController nameCtr = TextEditingController();
  TextEditingController surnameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  String? genderDropdown;
  List<String> gendersList = ["Male", "Female"];

  void updateEditPageBuildContext(BuildContext context) {
    ctxEditPage = context;
  }

  void initializeEditPageMethods() async {
    updateEditPageParameters();
  }

  void updateEditPageParameters() {
    nameCtr.text = userInfo!.name;
    surnameCtr.text = userInfo!.surname;
    emailCtr.text = userInfo!.email;
    phoneCtr.text = userInfo!.phoneNumber;
    genderDropdown = userInfo!.gender;
  }

  void updateGenderDropdown(String newValue) {
    genderDropdown = newValue;
    notifyListeners();
  }

  void editPageUpdateButtonFunc() async {
    try {
      if (nameCtr.text.isEmpty ||
          surnameCtr.text.isEmpty ||
          phoneCtr.text.isEmpty) {
        await mySimpleDialogWidget(
          context: ctxEditPage!,
          title: 'Error',
          description: "Please fill all blanks",
          imagePath: errorRedCross,
        );
      } else {
        await userRepository.updateUserInfoFromDS(
          UpdateUserInfoRequest(
            name: nameCtr.text,
            surname: surnameCtr.text,
            email: emailCtr.text,
            phoneNumber: phoneCtr.text,
            gender: genderDropdown!,
          ),
        );
        await mySimpleDialogWidget(
          context: ctxEditPage!,
          title: 'Success',
          description: 'User info updated successfully',
          imagePath: successStar,
        );
        getUserInfoFromDomain();
        notifyListeners();
        Navigator.pop(ctxEditPage!);
      }
    } catch (e) {
      print(e);
    }
  }

  /// My Bookmarks Page
  BuildContext? ctxMyBookmarksPage;

  String myBookmarksIconPath = saveBeige;
  void updateMyBookmarksPageBuildContext(BuildContext context) {
    ctxEditPage = context;
  }

  void removeEventFromMyBookmarks(int eventId) async {
    await eventRepository.deleteEventToBookmarks(
      userId: userRepository.getUserInfo()!.id,
      eventId: eventId,
    );
    myBookmarksList = await profileRepository.getProfileBookmarksEventList();
    notifyListeners();
  }
}
