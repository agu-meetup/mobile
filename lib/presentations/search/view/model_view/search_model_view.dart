import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/presentations/search/view/model/search_card_model.dart';
import 'package:flutter/cupertino.dart';

class SearchModelView extends ChangeNotifier {
  BuildContext? ctx;

  void updateContextData(BuildContext context) {
    ctx = context;
  }

  /// Search Properties
  String searchHintText = "Search event..";
  String? searchVal;

  ///Search Icons
  String adjustSearchIcon = adjustSearch;

  void changeSearchVal(String? newSearchVal) {
    searchVal = newSearchVal;
  }

  /// SortBy
  String? sortDropdownValue;

  List<String> sortOptionList = const [
    "Sort Option 1",
    "Sort Option 2",
    "Sort Option 3",
  ];
  List<SearchCardModel> cardsInfo = [
    SearchCardModel(
      id: 1,
      notificationTitle: "Az kaldı",
      eventTitle: "Batal",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
    SearchCardModel(
      id: 2,
      notificationTitle: "Azzz",
      eventTitle: "Batakkk",
      date: "12.12.2023",
      time: "21:45",
      locationName: "Hasan Kıraathanesi",
      city: "Kocasinan",
    ),
    SearchCardModel(
      id: 3,
      notificationTitle: "Az kaldı",
      eventTitle: "Yeni Oyun",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
    SearchCardModel(
      id: 4,
      notificationTitle: "Az123",
      eventTitle: "Batal",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
    SearchCardModel(
      id: 5,
      notificationTitle: "Az asdfasf",
      eventTitle: "Batal",
      date: "12.12.2023",
      time: "21:30",
      locationName: "Güler Kıraathanesi",
      city: "Talas",
    ),
  ];
  void changeSelectedSortOption(String? selectedSortOption) {
    sortDropdownValue = selectedSortOption;
    notifyListeners();
  }
}
