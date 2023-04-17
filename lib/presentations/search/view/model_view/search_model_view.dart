import 'package:agu_meetup_mobile/core/assets.dart';
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
  void changeSelectedSortOption(String? selectedSortOption) {
    sortDropdownValue = selectedSortOption;
    notifyListeners();
  }
}
