import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventInfoModel {
  List<XFile> selectedImages;
  TextEditingController titleCtr;
  TextEditingController locationAddressCtr;
  TextEditingController forDirectionsCtr;
  LatLng? targetPosition;
  Uint8List? imageBytes;
  TextEditingController placeNameCtr;
  bool isActiveAllDay;
  TextEditingController dateSelectorController;
  TextEditingController startTimeController;
  TextEditingController endTimeController;
  TextEditingController detailCtr;
  TextEditingController quotaCtr;
  String? genderDropdownValue;
  String? categoryDropdownValue;
  bool isFree;
  TextEditingController priceCtr;
  List<TextEditingController> hostsControllers;
  String? allHostsText;
  String? city;
  String? subCity;

  CreateEventInfoModel({
    required this.selectedImages,
    required this.titleCtr,
    this.targetPosition,
    this.imageBytes,
    required this.placeNameCtr,
    required this.isActiveAllDay,
    required this.dateSelectorController,
    required this.startTimeController,
    required this.endTimeController,
    required this.detailCtr,
    required this.quotaCtr,
    this.genderDropdownValue,
    this.categoryDropdownValue,
    required this.isFree,
    required this.priceCtr,
    required this.hostsControllers,
    this.allHostsText,
    required this.locationAddressCtr,
    required this.forDirectionsCtr,
    this.city,
    this.subCity,
  });
}
