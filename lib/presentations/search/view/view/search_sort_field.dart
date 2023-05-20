import 'package:agu_meetup_mobile/presentations/search/view/widgets/search_dropdown_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_view/search_model_view.dart';

class SearchSortDropdown extends StatefulWidget {
  const SearchSortDropdown({super.key});

  @override
  State<SearchSortDropdown> createState() => _SearchSortDropdownState();
}

class _SearchSortDropdownState extends State<SearchSortDropdown> {
  @override
  Widget build(BuildContext context) {
    context.read<SearchModelView>().updateContextData(context);
    return Consumer<SearchModelView>(builder: (context, mv, chield) {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchDropdown(
                    hintText: "Sort By",
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchDropdown(
                    hintText: "Location",
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchDropdown(
                    hintText: "Date",
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchDropdown(
                    hintText: "Time",
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchDropdown(
                    hintText: "Gender",
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SearchDropdown(
                    hintText: "Price",
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
            ],
          ),
        ),
      );
    });
  }
}
