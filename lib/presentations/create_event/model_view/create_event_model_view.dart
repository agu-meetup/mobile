import 'dart:async';
import 'dart:typed_data';

import 'package:agu_meetup_mobile/components/my_buttons/my_text_button_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

import '../view/create_event_maps_view.dart';

class CreateEventModelView extends ChangeNotifier {
  late BuildContext ctx;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  List<XFile> selectedImages = [];

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  String? eventTitleVal;
  void changeEventTitle(String? val) {
    eventTitleVal = eventTitleVal;
  }

  /// Google Maps
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  late CameraPosition initialLocation = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );

  Position? currentPosition;
  LatLng? targetPosition;

  void updateTargetPosition(LatLng newTargetPosition) {
    targetPosition = newTargetPosition;
    if (targetPosition != null) {
      notifyListeners();
    }
  }

  void clearTargetPosition() {
    targetPosition = null;
    currentPosition = null;
    notifyListeners();
  }

  Future<void> openMapButton() async {
    Navigator.push(
        ctx, MaterialPageRoute(builder: (_) => CreateEventMapsView()));
    initializeGoogleMaps();
  }

  void initializeGoogleMaps() async {
    try {
      currentPosition = await _determinePosition();
      if (currentPosition != null) {
        if (targetPosition != null) {
          initialLocation = CameraPosition(
            target: LatLng(targetPosition!.latitude, targetPosition!.longitude),
            zoom: 14.4746,
          );
        } else {
          initialLocation = CameraPosition(
            target:
                LatLng(currentPosition!.latitude, currentPosition!.longitude),
            zoom: 14.4746,
          );
        }
        mapController = Completer<GoogleMapController>();
        notifyListeners();
      }
    } catch (e) {
      print("error");
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> selectPlaceButtonFunc() async {
    await captureSsMap();
    currentPosition = null;
  }

  /// Capture ScreenShot
  Uint8List? imageBytes;
  Future<void> captureSsMap() async {
    print(mapController);
    GoogleMapController controller = await mapController.future;
    imageBytes = await controller.takeSnapshot();
    notifyListeners();
  }

  void uploadButtonFunc() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: ctx,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyTextButtonWidget(
                  text: 'From Gallery',
                  onTanFunc: () async {
                    photo =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (photo != null) {
                      selectedImages.add(photo!);
                    }
                    notifyListeners();
                  },
                ),
                MyTextButtonWidget(
                  text: 'From Camera',
                  onTanFunc: () async {
                    photo = await _picker.pickImage(source: ImageSource.camera);
                    if (photo != null) {
                      selectedImages.add(photo!);
                    }
                    notifyListeners();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
