import 'dart:async';
import 'dart:typed_data';

import 'package:agu_meetup_mobile/components/my_buttons/my_text_button_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model/create_event_current_user_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart' as intl;

import '../view/create_event_maps_view.dart';

class CreateEventModelView extends ChangeNotifier {
  /// Domain Layers
  UserRepository userRepository = UserRepository();

  late BuildContext ctx;
  bool isPageLoaded = false;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  List<XFile> selectedImages = [];

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  Future<void> initialMethods() async{
    updateCreateEventUserModel();
    isPageLoaded = true;
  }

  /// Image Upload
  void photoUploadButtonFunc() {
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

  void removeImage(int imageIndex) {
    selectedImages.removeAt(imageIndex);
    notifyListeners();
  }

  /// Event Title
  TextEditingController titleCtr = TextEditingController();

  /// Google Maps - Location
  TextEditingController placeNameCtr = TextEditingController();
  String? addressSelectedLocation;
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
    await updateAddress();
    currentPosition = null;
    notifyListeners();
  }

  Future<void> updateAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        targetPosition!.latitude, targetPosition!.longitude);
    if (placemarks.isNotEmpty) {
      addressSelectedLocation = "";
      if (placemarks[0].subLocality!.isNotEmpty) {
        addressSelectedLocation =
            "$addressSelectedLocation${placemarks[0].subLocality}, ";
      }
      if (placemarks[0].thoroughfare!.isNotEmpty) {
        addressSelectedLocation =
            "$addressSelectedLocation${placemarks[0].thoroughfare}, ";
      }
      if (placemarks[0].subThoroughfare!.isNotEmpty) {
        addressSelectedLocation =
            "$addressSelectedLocation${placemarks[0].subThoroughfare}, ";
      }
      if (placemarks[0].subAdministrativeArea!.isNotEmpty) {
        addressSelectedLocation =
            "$addressSelectedLocation${placemarks[0].subAdministrativeArea}/";
      }
      if (placemarks[0].administrativeArea!.isNotEmpty) {
        addressSelectedLocation =
            "$addressSelectedLocation${placemarks[0].administrativeArea!.toUpperCase()}";
      }
    }
  }

  /// Capture ScreenShot
  Uint8List? imageBytes;
  Future<void> captureSsMap() async {
    print(mapController);
    GoogleMapController controller = await mapController.future;
    imageBytes = await controller.takeSnapshot();
    notifyListeners();
  }

  /// Select Date
  bool isActiveAllDay = false;
  void changeActiveAllDayValue(bool newVal) {
    isActiveAllDay = newVal;
    notifyListeners();
  }

  TextEditingController dateSelectorController = TextEditingController();
  Icon dateIcon = Icon(Icons.date_range, color: kGray.withOpacity(0.5));
  void changeDateValueFunc() async {
    DateTime? pickedDate = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = intl.DateFormat('yMMMMd').format(pickedDate);
      dateSelectorController.text = formattedDate;
      notifyListeners();
    }
  }

  /// Times
  TextEditingController startTimeController = TextEditingController();
  void changeStartTimeValueFunc() async {
    TimeOfDay? selectedTimeRTL = await showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
    if (selectedTimeRTL != null) {
      startTimeController.text =
          "${selectedTimeRTL.hour}:${selectedTimeRTL.minute}";
      notifyListeners();
    }
  }

  TextEditingController endTimeController = TextEditingController();
  void changeEndTimeValueFunc() async {
    TimeOfDay? selectedTimeRTL = await showTimePicker(
      context: ctx,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
    if (selectedTimeRTL != null) {
      endTimeController.text =
          "${selectedTimeRTL.hour}:${selectedTimeRTL.minute}";
      notifyListeners();
    }
  }

  /// Detail
  TextEditingController detailCtr = TextEditingController();

  /// Quota
  TextEditingController quotaCtr = TextEditingController();

  /// Gender
  String? genderDropdownValue;

  List<String> genderList = const [
    "All",
    "Male",
    "Female",
  ];
  void changeSelectedGender(String? selectedGender) {
    genderDropdownValue = selectedGender;
    notifyListeners();
  }

  /// Category
  String? categoryDropdownValue;
  List<String> categoryList = const [
    "Sport",
    "Table Game",
    "Theatre",
    "Cinema",
    "Trip",
  ];
  void changeSelectedCategory(String? selectedCategory) {
    categoryDropdownValue = selectedCategory;
    notifyListeners();
  }

  /// Price
  bool isFree = false;
  void changeIsFree(bool newVal) {
    isFree = newVal;
    notifyListeners();
  }

  TextInputType priceInputType = TextInputType.number;
  TextEditingController priceCtr = TextEditingController();

  /// Hosts
  CreateEventCurrentUserModel? createEventCurrentUserModel;
  void updateCreateEventUserModel() {
    createEventCurrentUserModel = CreateEventCurrentUserModel(
      userId: userRepository.getUserInfo()!.id,
      name: userRepository.getUserInfo()!.name,
      surname: userRepository.getUserInfo()!.surname,
    );
  }

  List<TextEditingController> hostsControllers = [];
  void addNewHostValue() {
    hostsControllers.add(TextEditingController());
    notifyListeners();
  }

  void removeHostValue(int index) {
    hostsControllers.removeAt(index);
    notifyListeners();
  }
}
