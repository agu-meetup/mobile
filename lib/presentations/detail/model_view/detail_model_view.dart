import 'dart:async';

import 'package:agu_meetup_mobile/components/my_dialogs/my_simple_dialog_widget.dart';
import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/data/comment/models/create_comment_request_model.dart';
import 'package:agu_meetup_mobile/domains/comment/repository/comment_repository.dart';
import 'package:agu_meetup_mobile/domains/detail_participants/repository/detail_participants_repository.dart';
import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';
import 'package:agu_meetup_mobile/presentations/detail/model/detail_comment_model.dart';
import 'package:agu_meetup_mobile/presentations/detail/model/detail_info_model.dart';
import 'package:agu_meetup_mobile/presentations/detail/view/detail_map_view.dart';
import 'package:agu_meetup_mobile/presentations/detail_participants/view/detail_participants_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

enum DetailPageType {
  myEvent,
  newEvent,
  joinedEvent,
  pastEvent,
}

class DetailModelView extends ChangeNotifier {
  /// Domain Layer
  EventRepository eventRepository = EventRepository();
  UserRepository userRepository = UserRepository();
  DetailParticipantsRepository detailParticipantsRepository =
      DetailParticipantsRepository();
  CommentRepository commentRepository = CommentRepository();

  late BuildContext ctx;
  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  DetailInfoModel? detailInfoModel;
  bool isPageLoaded = false;
  DetailPageType detailPageType = DetailPageType.newEvent;

  void initializeMethods() async {
    isPageLoaded = false;
    await getEventDetailById();
    await getCommentDetail();
    checkEventStatus();
    isEventBookmarkedFunc();
    isPageLoaded = true;
    notifyListeners();
  }

  Future<void> getEventDetailById() async {
    detailInfoModel = await eventRepository.getEventDetail();
  }

  void checkEventStatus() {
    if (userRepository.getUserInfo()!.id == detailInfoModel!.userId) {
      detailPageType = DetailPageType.myEvent;
    } else if (detailInfoModel!.userIdList
        .contains(userRepository.getUserInfo()!.id)) {
      if (detailInfoModel!.eventStartDate.isBefore(DateTime.now())) {
        detailPageType = DetailPageType.pastEvent;
      } else {
        detailPageType = DetailPageType.joinedEvent;
      }
    }
  }

  /// AppBar Functions
  bool isEventSaved = false;
  void isEventBookmarkedFunc() {
    isEventSaved = eventRepository
        .getBookmarksEventIds()
        .contains(detailInfoModel!.eventId);
  }

  void bookmarkButtonFunc() async {
    if (isEventSaved) {
      await eventRepository.deleteEventToBookmarks(
        userId: userRepository.getUserInfo()!.id,
        eventId: detailInfoModel!.eventId,
      );
    } else {
      await eventRepository.addEventToBookmarks(
        userId: userRepository.getUserInfo()!.id,
        eventId: detailInfoModel!.eventId,
      );
    }
    isEventBookmarkedFunc();
    notifyListeners();
  }

  /// Carousel Slider
  int imageIndex = 0;
  void updateImageIndex(int newImageIndex) {
    imageIndex = newImageIndex;
    notifyListeners();
  }

  /// Hosted people and price
  String mainHostImage = "assets/test_image/test_profile_pic.png";

  /// Event Title

  /// General Info

  /// Detail

  /// Button Functions
  // Participants Func
  void membersButtonFunc() {
    detailParticipantsRepository.updateUserIdList(detailInfoModel!.userIdList
      ..removeWhere((e) => e == userRepository.getUserInfo()!.id));
    Navigator.push(
        ctx, MaterialPageRoute(builder: (_) => DetailParticipantsView()));
  }

  // Delete Func
  Future<void> deleteButtonFunc() async {
    try {
      await eventRepository.deleteEventById(eventId: detailInfoModel!.eventId);
      await mySimpleDialogWidget(
          context: ctx,
          title: "Success",
          description: "Event removed successfully",
          imagePath: successStar);
      Navigator.pop(ctx);
    } catch (e) {
      print(e);
      await mySimpleDialogWidget(
        context: ctx,
        title: "Error",
        description: "Event are NOT removed",
        imagePath: errorRedCross,
      );
    }
  }

  // Leave Func
  Future<void> leaveEventButtonFunc() async {
    try {
      await eventRepository.leaveEvent(
        eventId: detailInfoModel!.eventId,
        userId: userRepository.getUserInfo()!.id,
      );
      await mySimpleDialogWidget(
          context: ctx,
          title: "Success",
          description: "You leave from the event successfully",
          imagePath: successStar);
      Navigator.pop(ctx);
    } catch (e) {
      print(e);
      await mySimpleDialogWidget(
        context: ctx,
        title: "Error",
        description: "You CAN'T leave from event",
        imagePath: errorRedCross,
      );
    }
  }

  /// Comments
  late List<DetailCommentModel?> comments;
  Future<void> getCommentDetail() async {
    comments = await eventRepository.getCommentDetail();
  }

  int showedComment = 2;

  void changeShowedComment() {
    showedComment = comments.length;
    notifyListeners();
  }

  TextEditingController commentController = TextEditingController();

  void sendComment() async {
    // Send Comment to back end
    await commentRepository.createComment(CreateCommentRequestModel(
      userId: userRepository.getUserInfo()!.id,
      eventId: detailInfoModel!.eventId,
      commentText: commentController.text,
    ));
    await getCommentDetail();
    commentController.text = "";
    notifyListeners();
  }

  /// Map
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void openMapButton() {
    mapController = Completer<GoogleMapController>();
    setPlaceLocationToInitialLocation();
    setPlaceMarker();
    Navigator.push(ctx, MaterialPageRoute(builder: (_) => DetailMapView()));
  }

  late CameraPosition initialLocation = CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );

  void setPlaceLocationToInitialLocation() {
    initialLocation = CameraPosition(
      target: LatLng(detailInfoModel!.lattiude, detailInfoModel!.longitude),
      zoom: 14.4746,
    );
  }

  void setPlaceMarker() {
    MarkerId markerId = const MarkerId("marker1");
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(detailInfoModel!.lattiude, detailInfoModel!.longitude),
    );
    markers[markerId] = marker;
  }
}
