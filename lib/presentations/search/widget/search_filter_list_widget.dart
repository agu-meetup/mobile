import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/size_config.dart';
import './widget.dart';

class SearchFilterListWidget extends StatelessWidget {
  String filterTitle;
  List<String> filterList;
  String selectedValue;
  Function selectionFunc;

  SearchFilterListWidget({
    required this.filterTitle,
    required this.filterList,
    required this.selectedValue,
    required this.selectionFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              filterTitle,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth!,
          height: 54,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filterList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectionFunc(filterList[index]);
                },
                child: SearchFilterElementWidget(
                  filteredElement: filterList[index],
                  isSelected: filterList[index] == selectedValue,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
