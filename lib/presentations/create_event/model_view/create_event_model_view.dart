import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:agu_meetup_mobile/components/my_buttons/my_text_button_widget.dart';
import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/data/address/model/create_address_request_model.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';
import 'package:agu_meetup_mobile/domains/address/repository/address_repository.dart';
import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';
import 'package:agu_meetup_mobile/presentations/bottom_bar/model_view/bottom_bar_model_view.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model/create_event_current_user_model.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model/create_event_info_model.dart';
import 'package:agu_meetup_mobile/presentations/create_event/widget/create_event_preview_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../../../components/my_dialogs/my_simple_dialog_widget.dart';
import '../view/create_event_maps_view.dart';

class CreateEventModelView extends ChangeNotifier {
  /// Domain Layers
  UserRepository userRepository = UserRepository();
  EventRepository eventRepository = EventRepository();
  AddressRepository addressRepository = AddressRepository();

  late BuildContext ctx;
  late BuildContext previewDialogCtx;
  late CreateEventInfoModel createEventInfoModel;
  bool isPageLoaded = false;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  void updatePreviewDialogBuildContext(BuildContext context) {
    previewDialogCtx = context;
  }

  Future<void> initialMethods() async {
    initializeCreateEventInfo();
    updateCreateEventUserModel();
    isPageLoaded = true;
  }

  void initializeCreateEventInfo() {
    createEventInfoModel = CreateEventInfoModel(
      selectedImages: [],
      titleCtr: TextEditingController(),
      placeNameCtr: TextEditingController(),
      isActiveAllDay: false,
      dateSelectorController: TextEditingController(),
      startTimeController: TextEditingController(),
      endTimeController: TextEditingController(),
      detailCtr: TextEditingController(),
      quotaCtr: TextEditingController(),
      isFree: false,
      priceCtr: TextEditingController(),
      hostsControllers: [],
      locationAddressCtr: TextEditingController(),
      forDirectionsCtr: TextEditingController(),
    );
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
                      createEventInfoModel.selectedImages.add(photo!);
                    }
                    notifyListeners();
                  },
                ),
                MyTextButtonWidget(
                  text: 'From Camera',
                  onTanFunc: () async {
                    photo = await _picker.pickImage(source: ImageSource.camera);
                    if (photo != null) {
                      createEventInfoModel.selectedImages.add(photo!);
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
    createEventInfoModel.selectedImages.removeAt(imageIndex);
    notifyListeners();
  }

  /// Event Title

  /// Google Maps - Location
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  late CameraPosition initialLocation = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );

  Position? currentPosition;

  void updateTargetPosition(LatLng newTargetPosition) {
    createEventInfoModel.targetPosition = newTargetPosition;
    if (createEventInfoModel.targetPosition != null) {
      notifyListeners();
    }
  }

  void clearTargetPosition() {
    createEventInfoModel.targetPosition = null;
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
        if (createEventInfoModel.targetPosition != null) {
          initialLocation = CameraPosition(
            target: LatLng(createEventInfoModel.targetPosition!.latitude,
                createEventInfoModel.targetPosition!.longitude),
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
        createEventInfoModel.targetPosition!.latitude,
        createEventInfoModel.targetPosition!.longitude);
    if (placemarks.isNotEmpty) {
      createEventInfoModel.locationAddressCtr.text = "";
      if (placemarks[0].subLocality!.isNotEmpty) {
        createEventInfoModel.locationAddressCtr.text =
            "${createEventInfoModel.locationAddressCtr.text}${placemarks[0].subLocality}, ";
      }
      if (placemarks[0].thoroughfare!.isNotEmpty) {
        createEventInfoModel.locationAddressCtr.text =
            "${createEventInfoModel.locationAddressCtr.text}${placemarks[0].thoroughfare}, ";
      }
      if (placemarks[0].subThoroughfare!.isNotEmpty) {
        createEventInfoModel.locationAddressCtr.text =
            "${createEventInfoModel.locationAddressCtr.text}${placemarks[0].subThoroughfare}";
      }
      if (placemarks[0].subAdministrativeArea!.isNotEmpty) {
        createEventInfoModel.subCity = placemarks[0].subAdministrativeArea;
      }
      if (placemarks[0].administrativeArea!.isNotEmpty) {
        createEventInfoModel.city =
            placemarks[0].administrativeArea!.toUpperCase();
      }
    }
  }

  /// Capture ScreenShot
  Future<void> captureSsMap() async {
    print(mapController);
    GoogleMapController controller = await mapController.future;
    createEventInfoModel.imageBytes = await controller.takeSnapshot();
    notifyListeners();
  }

  /// Select Date
  void changeActiveAllDayValue(bool newVal) {
    createEventInfoModel.isActiveAllDay = newVal;
    notifyListeners();
  }

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
      createEventInfoModel.dateSelectorController.text = formattedDate;
      notifyListeners();
    }
  }

  /// Times
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
      createEventInfoModel.startTimeController.text =
          hourAndMinuteConventToString(startTimeHour, startTimeMinute);
      notifyListeners();
    }
  }

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
      createEventInfoModel.endTimeController.text =
          hourAndMinuteConventToString(endTimeHour, endTimeMinute);
      notifyListeners();
    }
  }

  String hourAndMinuteConventToString(int hour, int minute) {
    String hourText = "$hour";
    String minuteText = "$minute";
    if (hour < 10) {
      hourText = "0$hour";
    }
    if (minute < 10) {
      minuteText = "0$minute";
    }
    return "$hourText:$minuteText";
  }

  /// Detail

  /// Quota
  TextInputType quotaInputType = TextInputType.number;

  /// Gender

  List<String> genderList = const [
    "All",
    "Male",
    "Female",
  ];
  void changeSelectedGender(String? selectedGender) {
    createEventInfoModel.genderDropdownValue = selectedGender;
    notifyListeners();
  }

  /// Category
  List<String> categoryList = const [
    "Sport",
    "Table Game",
    "Theatre",
    "Cinema",
    "Trip",
  ];
  void changeSelectedCategory(String? selectedCategory) {
    createEventInfoModel.categoryDropdownValue = selectedCategory;
    notifyListeners();
  }

  /// Price
  void changeIsFree(bool newVal) {
    createEventInfoModel.isFree = newVal;
    notifyListeners();
  }

  TextInputType priceInputType = TextInputType.number;

  /// Hosts
  CreateEventCurrentUserModel? createEventCurrentUserModel;
  void updateCreateEventUserModel() {
    createEventCurrentUserModel = CreateEventCurrentUserModel(
      userId: userRepository.getUserInfo()!.id,
      name: userRepository.getUserInfo()!.name,
      surname: userRepository.getUserInfo()!.surname,
    );
  }

  String hostTextFieldToString() {
    String tempHosts =
        "${userRepository.getUserInfo()!.name} ${userRepository.getUserInfo()!.surname}";
    for (int i = 0; i < createEventInfoModel.hostsControllers.length; i++) {
      if (createEventInfoModel.hostsControllers[i].text != "") {
        tempHosts += "-${createEventInfoModel.hostsControllers[i].text}";
      }
    }
    return tempHosts;
  }

  String hostTextFieldToStringForPreview() {
    String tempHosts =
        "${userRepository.getUserInfo()!.name} ${userRepository.getUserInfo()!.surname}";
    for (int i = 0; i < createEventInfoModel.hostsControllers.length; i++) {
      if (createEventInfoModel.hostsControllers[i].text != "") {
        tempHosts += ", ${createEventInfoModel.hostsControllers[i].text}";
      }
    }
    return tempHosts;
  }

  void addNewHostValue() {
    createEventInfoModel.hostsControllers.add(TextEditingController());
    notifyListeners();
  }

  void removeHostValue(int index) {
    createEventInfoModel.hostsControllers.removeAt(index);
    notifyListeners();
  }

  /// Alert Dialog Parameters
  int sliderImageIndex = 0;
  void updateSliderImageIndex(int newImageIndex) {
    sliderImageIndex = newImageIndex;
    notifyListeners();
  }

  /// Create Event Button
  bool isPreviewCreatedEventClicked = false;
  bool isEventAddedSituation = false;

  void previewCreateButtonFunc() {
    isPreviewCreatedEventClicked = true;
    Navigator.pop(previewDialogCtx);
  }

  void createEventButtonFunc() async {
    try {
      if (selectedDate != null &&
          (createEventInfoModel.isActiveAllDay ||
              (startTimeHour != -1 &&
                  startTimeMinute != -1 &&
                  endTimeHour != -1 &&
                  endTimeMinute != -1)) &&
          createEventInfoModel.targetPosition != null &&
          createEventInfoModel.titleCtr.text != "" &&
          createEventInfoModel.detailCtr.text != "" &&
          createEventInfoModel.categoryDropdownValue != null &&
          createEventInfoModel.quotaCtr.text != "" &&
          createEventInfoModel.genderDropdownValue != null &&
          createEventInfoModel.locationAddressCtr.text != "") {
        createEventInfoModel.allHostsText = hostTextFieldToStringForPreview();
        isPreviewCreatedEventClicked = false;
        if (createEventInfoModel.isActiveAllDay) {
          startTimeHour = 0;
          startTimeMinute = 0;
          endTimeHour = 23;
          endTimeMinute = 59;
          createEventInfoModel.startTimeController.text =
              "$startTimeHour:$startTimeMinute";
          createEventInfoModel.endTimeController.text =
              "$endTimeHour:$endTimeMinute";
        }
        if (int.tryParse(createEventInfoModel.quotaCtr.text) == null) {
          await mySimpleDialogWidget(
            imagePath: errorRedCross,
            context: ctx,
            title: 'Error',
            description: 'Please enter valid quota number',
          );
        } else if (createEventInfoModel.priceCtr.text != "" &&
            createEventInfoModel.isFree == false) {
          if (double.tryParse(createEventInfoModel.priceCtr.text) == null) {
            await mySimpleDialogWidget(
              imagePath: errorRedCross,
              context: ctx,
              title: 'Error',
              description: 'Please enter valid price number',
            );
          } else {
            await createEventPreviewDialogWidget(
              context: ctx,
              createEventInfoModel: createEventInfoModel,
              updateSliderImageIndex: updateSliderImageIndex,
              previewFinishButton: previewCreateButtonFunc,
            );
            if (isPreviewCreatedEventClicked) {
              isEventAddedSituation = true;
              notifyListeners();
              await createEventRequestFunction();
            }
          }
        } else {
          await createEventPreviewDialogWidget(
            context: ctx,
            createEventInfoModel: createEventInfoModel,
            updateSliderImageIndex: updateSliderImageIndex,
            previewFinishButton: previewCreateButtonFunc,
          );
          if (isPreviewCreatedEventClicked) {
            isEventAddedSituation = true;
            notifyListeners();
            await createEventRequestFunction();
          }
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
    String priceTempText = createEventInfoModel.priceCtr.text;
    if (createEventInfoModel.isFree == true ||
        createEventInfoModel.priceCtr.text == "") {
      priceTempText = "0";
    }
    String tempHosts = hostTextFieldToString();
    List<File> imageFiles =
        createEventInfoModel.selectedImages.map((e) => File(e.path)).toList();
    try {
      int createdUserId = await eventRepository.createEvent(
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
          lattiude: createEventInfoModel.targetPosition!.latitude,
          longitude: createEventInfoModel.targetPosition!.longitude,
          name: createEventInfoModel.titleCtr.text,
          description: createEventInfoModel.detailCtr.text,
          title: createEventInfoModel.titleCtr.text,
          category: createEventInfoModel.categoryDropdownValue!,
          maxParticipants: int.parse(createEventInfoModel.quotaCtr.text),
          hosts: tempHosts,
          gender: createEventInfoModel.genderDropdownValue!,
          imageUrl: "img",
          price: double.parse(priceTempText),
          imageFiles: imageFiles,
        ),
      );
      await addressRepository.createAddress(
        CreateAddressRequestModel(
            country: 'Turkey',
            province: createEventInfoModel.city!,
            district: createEventInfoModel.subCity!,
            subLocality: createEventInfoModel.locationAddressCtr.text,
            forDirection: createEventInfoModel.forDirectionsCtr.text,
            locationName: createEventInfoModel.placeNameCtr.text,
            eventId: createdUserId),
      );
      isEventAddedSituation = false;
      notifyListeners();
      await mySimpleDialogWidget(
        title: "Success",
        description: "Event was created successfully",
        imagePath: successStar,
        context: ctx,
      );
      ctx.read<BottomBarModelView>().changeBarIndex(4);
    } catch (e) {
      print(e);
      isEventAddedSituation = false;
      notifyListeners();
      await mySimpleDialogWidget(
        title: "Error",
        description: "Event creation was failed",
        imagePath: errorRedCross,
        context: ctx,
      );
    }
  }
}
