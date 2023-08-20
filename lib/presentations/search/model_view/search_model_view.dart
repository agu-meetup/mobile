import 'package:flutter/material.dart';

import '../widget/widget.dart';

class SearchModelView extends ChangeNotifier {
  late BuildContext ctx;

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  /// Attributes
  DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  /// Filters
  void filterButtonFunc() {
    searchFilterBottomSheet(ctx: ctx);
  }

  void initializeMethods() {
    datesMap["All"] = null;
    datesMap["Today"] = today;
    datesMap["Tomorrow"] = today.add(const Duration(days: 1));
    datesMap["StartDate"] = today;
    datesMap["EndDate"] = today.add(const Duration(days: 14));
  }

  String locationFilterValue = "All";
  List<String> locations = [
    "All",
    "Kayseri",
    "Kocasinan",
    "Talas",
    "Melikgazi",
  ];
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