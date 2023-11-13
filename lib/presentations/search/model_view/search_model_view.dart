import 'package:agu_meetup_mobile/domains/address/repository/address_repository.dart';
import 'package:agu_meetup_mobile/presentations/profile/model_view/profile_model_view.dart';
import 'package:flutter/material.dart';

import '../widget/widget.dart';

enum SearchPageStatus {
  loading,
  success,
  failed,
}

class SearchModelView extends ChangeNotifier {
  late BuildContext ctx;

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  /// Attributes
  DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  SearchPageStatus searchPageStatus = SearchPageStatus.loading;

  /// Domain Layers
  AddressRepository addressRepository = AddressRepository();

  /// Filters
  void filterButtonFunc() {
    searchFilterBottomSheet(ctx: ctx);
  }

  void initializeMethods() async{
    searchPageStatus = SearchPageStatus.loading;

    initializeDates();
    initializeLocations();

    searchPageStatus = SearchPageStatus.success;
    // notifyListeners();
  }

  String locationFilterValue = "All";
  List<String> locations = [
    "All",
    "Kayseri",
    "Kocasinan",
    "Talas",
    "Melikgazi",
  ];
  void initializeLocations() {
    locations.clear();
    locations.add("All");
    List<String> closestLocations = addressRepository.getClosestLocationNameFromStatic();
    locations.addAll(closestLocations);
  }
  void changeLocationFilterValue(String val) {
    locationFilterValue = val;
    notifyListeners();
  }

  String categoryFilterValue = "All";
  List<String> categories = [
    "All",
    "Sport",
    "Table Game",
    "Theatre",
    "Cinema",
    "Trip",
  ];
  void changeCategoryFilterValue(String val) {
    categoryFilterValue = val;
    notifyListeners();
  }

  String genderFilterValue = "All";
  List<String> genders = [
    "All",
    "Male",
    "Female",
  ];
  void changeGenderFilterValue(String val) {
    genderFilterValue = val;
    notifyListeners();
  }

  String priceFilterValue = "All";
  List<String> prices = [
    "All",
    "Free",
    "Paid",
  ];
  void changePriceFilterValue(String val) {
    priceFilterValue = val;
    notifyListeners();
  }

  String dateFilterValue = "All";
  List<String> dates = [
    "All",
    "Today",
    "Tomorrow",
    "Selected Date",
  ];
  void changeDateFilterValue(String val) {
    dateFilterValue = val;
    notifyListeners();
  }
  Map<String, DateTime?> datesMap = {};
  void initializeDates() {
    datesMap["All"] = null;
    datesMap["Today"] = today;
    datesMap["Tomorrow"] = today.add(const Duration(days: 1));
    datesMap["StartDate"] = today;
    datesMap["EndDate"] = today.add(const Duration(days: 14));
  }
  void selectStartDateFunc() async {
    DateTime? pickedDate = await showDatePicker(
      context: ctx,
      initialDate: datesMap["StartDate"]!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      datesMap["StartDate"] = pickedDate;
      notifyListeners();
    }
  }

  void selectEndDateFunc() async {
    DateTime? pickedDate = await showDatePicker(
      context: ctx,
      initialDate: datesMap["EndDate"]!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      datesMap["EndDate"] = pickedDate;
      notifyListeners();
    }
  }
}