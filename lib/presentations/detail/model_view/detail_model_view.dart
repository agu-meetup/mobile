import 'dart:async';

import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/presentations/detail/model/detail_comment_model.dart';
import 'package:agu_meetup_mobile/presentations/detail/model/detail_info_model.dart';
import 'package:agu_meetup_mobile/presentations/detail/view/detail_map_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailModelView extends ChangeNotifier {
  /// Domain Layer
  EventRepository eventRepository = EventRepository();

  late BuildContext ctx;
  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  DetailInfoModel? detailInfoModel;

  bool isPageLoaded = false;

  void initializeMethods() async{
    isPageLoaded = false;
    await getEventDetailById();
    isPageLoaded = true;
    notifyListeners();
  }

  Future<void> getEventDetailById() async{
    detailInfoModel = await eventRepository.getEventDetail();
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
  // String eventDateInfo = "December 13, 2022";
  // String eventTimeInfo = "6:30 pm - 7:30 pm";
  // String eventPlaceInfo = "KIRAATHANE";
  // String eventCityInfo = "Kocasinan, KAYSERI";
  // String eventMembersInfo = "3 / 5";

  /// Detail
  String detailTextInfo =
      "Efsane batak etkinliği\n - Yenilen son 2 kişisap ödeyeceği etkinliğimize herkesi bekleriz.";

  /// Comments
  List<DetailCommentModel> comments = [
    DetailCommentModel(
      userPhoto: 'assets/test_image/test_profile_pic.png',
      nameSurname: 'Alaattin Öztürk',
      commentDetail:
          'Etkinliği merakla bekliyorum. Orada olmak. Şimşekleri içmek için sabırsızlanıyorum. <3.',
    ),
    DetailCommentModel(
      userPhoto: 'assets/test_image/test_profile_pic.png',
      nameSurname: 'Ömer Akçan',
      commentDetail:
          'Etkinliği merakla bekliyorum. Orada olmak. Şimşekleri içmek için sabırsızlanıyorum. <3.',
    ),
    DetailCommentModel(
      userPhoto: 'assets/test_image/test_profile_pic.png',
      nameSurname: 'Ömer Uluyağmur',
      commentDetail:
          'Etkinliği merakla bekliyorum. Orada olmak. Şimşekleri içmek için sabırsızlanıyorum. <3.',
    ),
    DetailCommentModel(
      userPhoto: 'assets/test_image/test_profile_pic.png',
      nameSurname: 'Buket Bayık',
      commentDetail:
          'Etkinliği merakla bekliyorum. Orada olmak. Şimşekleri içmek için sabırsızlanıyorum. <3.',
    ),
    DetailCommentModel(
      userPhoto: 'assets/test_image/test_profile_pic.png',
      nameSurname: 'Çağrı Karaca',
      commentDetail:
          'Etkinliği merakla bekliyorum. Orada olmak. Şimşekleri içmek için sabırsızlanıyorum. <3.',
    ),
  ];
  int showedComment = 2;

  void changeShowedComment() {
    showedComment = comments.length;
    notifyListeners();
  }

  TextEditingController commentController = TextEditingController();

  void sendComment() {
    // Send Comment to back end
    commentController.text = "";
    notifyListeners();
  }

  /// Map
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  // String eventAddress = "Erciyesevler, Güney Sk. 2-8, 38020 Kocasinan/Kayseri";
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void openMapButton() {
    mapController =
        Completer<GoogleMapController>();
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
