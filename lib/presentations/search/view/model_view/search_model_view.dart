import 'package:flutter/cupertino.dart';

class SearchModelView extends ChangeNotifier{

  BuildContext? ctx;

  void updateContextData(BuildContext context){
    ctx = context;
  }

  /// Search Properties
  String searchHintText = "Search event..";
  String? searchVal;

  void changeSearchVal(String? newSearchVal){
    searchVal = newSearchVal;
  }
}