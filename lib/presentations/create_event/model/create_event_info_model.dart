import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventInfoModel {
  late List<XFile> selectedImages;
  late TextEditingController titleCtr;
  late TextEditingController locationAddressCtr;
  late TextEditingController forDirectionsCtr;
  LatLng? targetPosition;
  Uint8List? imageBytes;
  late TextEditingController placeNameCtr;
  bool isActiveAllDay;
  late TextEditingController dateSelectorController;
  late TextEditingController startTimeController;
  late TextEditingController endTimeController;
  late TextEditingController detailCtr;
  late TextEditingController quotaCtr;
  String? genderDropdownValue;
  String? categoryDropdownValue;
  bool isFree;
  late TextEditingController priceCtr;
  late List<TextEditingController> hostsControllers;
  String? allHostsText;
  String? city;
  String? subCity;

  CreateEventInfoModel({
    this.targetPosition,
    this.isActiveAllDay = false,
    this.imageBytes,
    this.genderDropdownValue,
    this.categoryDropdownValue,
    this.isFree = false,
    this.allHostsText,
    this.city,
    this.subCity,
  }) {
    selectedImages = [];
    hostsControllers = [];
    titleCtr = TextEditingController();
    placeNameCtr = TextEditingController();
    dateSelectorController = TextEditingController();
    startTimeController = TextEditingController();
    endTimeController = TextEditingController();
    detailCtr = TextEditingController();
    quotaCtr = TextEditingController();
    priceCtr = TextEditingController();
    locationAddressCtr = TextEditingController();
    forDirectionsCtr = TextEditingController();
  }
}
