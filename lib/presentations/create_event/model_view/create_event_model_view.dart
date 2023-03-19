import 'dart:async';
import 'dart:typed_data';

import 'package:agu_meetup_mobile/components/my_buttons/my_text_button_widget.dart';
import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';
import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model/create_event_current_user_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart' as intl;

import '../../../components/my_dialogs/my_simple_dialog_widget.dart';
import '../view/create_event_maps_view.dart';

class CreateEventModelView extends ChangeNotifier {
  /// Domain Layers
  UserRepository userRepository = UserRepository();
  EventRepository eventRepository = EventRepository();

  late BuildContext ctx;
  bool isPageLoaded = false;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  List<XFile> selectedImages = [];

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  Future<void> initialMethods() async {
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
  DateTime? selectedDate;
  Icon dateIcon = Icon(Icons.date_range, color: kGray.withOpacity(0.5));
  void changeDateValueFunc() async {
    DateTime? pickedDate = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      String formattedDate = intl.DateFormat('yMMMMd').format(pickedDate);
      dateSelectorController.text = formattedDate;
      notifyListeners();
    }
  }

  /// Times
  TextEditingController startTimeController = TextEditingController();
  int startTimeHour = -1;
  int startTimeMinute = -1;
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
      startTimeHour = selectedTimeRTL.hour;
      startTimeMinute = selectedTimeRTL.minute;
      startTimeController.text =
          "${selectedTimeRTL.hour}:${selectedTimeRTL.minute}";
      notifyListeners();
    }
  }

  TextEditingController endTimeController = TextEditingController();
  int endTimeHour = -1;
  int endTimeMinute = -1;
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
      endTimeHour = selectedTimeRTL.hour;
      endTimeMinute = selectedTimeRTL.minute;
      endTimeController.text =
          "${selectedTimeRTL.hour}:${selectedTimeRTL.minute}";
      notifyListeners();
    }
  }

  /// Detail
  TextEditingController detailCtr = TextEditingController();

  /// Quota
  TextInputType quotaInputType = TextInputType.number;
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

  /// Create Event Button
  void createEventButtonFunc() async {
    try {
      if (selectedDate != null &&
          startTimeHour != -1 &&
          startTimeMinute != -1 &&
          endTimeHour != -1 &&
          endTimeMinute != -1 &&
          targetPosition != null &&
          titleCtr.text != "" &&
          detailCtr.text != "" &&
          categoryDropdownValue != null &&
          quotaCtr.text != "" &&
          genderDropdownValue != null) {
        if (int.tryParse(quotaCtr.text) == null) {
          await mySimpleDialogWidget(
            imagePath: errorRedCross,
            context: ctx,
            title: 'Error',
            description: 'Please enter valid quota number',
          );
        } else if (priceCtr.text != "" && isFree == false) {
          if (double.tryParse(priceCtr.text) == null) {
            await mySimpleDialogWidget(
              imagePath: errorRedCross,
              context: ctx,
              title: 'Error',
              description: 'Please enter valid price number',
            );
          }
          else {
            await createEventRequestFunction();
          }
        } else {
          await createEventRequestFunction();
        }
      } else {
        await mySimpleDialogWidget(
          imagePath: errorRedCross,
          context: ctx,
          title: 'Error',
          description: 'Please select all choices',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createEventRequestFunction() async {
    String priceTempText = priceCtr.text;
    if (isFree == true || priceCtr.text == "") {
      priceTempText = "0";
    }
    String tempHosts =
        "${userRepository.getUserInfo()!.name} ${userRepository.getUserInfo()!.surname}";
    for (int i = 0; i < hostsControllers.length; i++) {
      if (hostsControllers[i].text != "") {
        tempHosts += "-${hostsControllers[i].text}";
      }
    }
    await eventRepository.createEvent(
      CreateEventRequestModel(
        userId: userRepository.getUserInfo()!.id,
        creatingTime: DateTime.now().toIso8601String(),
        startTime: DateTime(selectedDate!.year, selectedDate!.month,
            selectedDate!.day, startTimeHour, startTimeMinute)
            .toIso8601String(),
        endTime: DateTime(selectedDate!.year, selectedDate!.month,
            selectedDate!.day, endTimeHour, endTimeMinute)
            .toIso8601String(),
        users: "${userRepository.getUserInfo()!.id}",
        lattiude: targetPosition!.latitude,
        longitude: targetPosition!.longitude,
        name: titleCtr.text,
        description: detailCtr.text,
        title: titleCtr.text,
        category: categoryDropdownValue!,
        maxParticipants: int.parse(quotaCtr.text),
        hosts: tempHosts,
        gender: genderDropdownValue!,
        imageUrl: "img",
        price: double.parse(priceTempText),
      ),
    );
    await mySimpleDialogWidget(
      title: "Success",
      description: "Event was created successfully",
      imagePath: successStar,
      context: ctx,
    );
  }
}
