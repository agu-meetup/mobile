import 'package:agu_meetup_mobile/components/my_dropdowns/my_dropdown_widget.dart';
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
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MyDropdownWidget(
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MyDropdownWidget(
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MyDropdownWidget(
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MyDropdownWidget(
                    dropdownValue: mv.searchVal,
                    elementList: mv.sortOptionList,
                    onChangedFunc: mv.changeSelectedSortOption),
              ),
              Container(
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MyDropdownWidget(
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
