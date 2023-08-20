import 'package:agu_meetup_mobile/core/size_config.dart';
import './widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchFilterDateWidget extends StatelessWidget {
  DateTime startDate;
  DateTime endDate;
  bool isSelected;
  Function startDateFunc;
  Function endDateFunc;

  SearchFilterDateWidget({
    required this.startDate,
    required this.endDate,
    required this.isSelected,
    required this.startDateFunc,
    required this.endDateFunc,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth!,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (isSelected) {
                  startDateFunc();
                }
              },
              child: SearchFilterElementWidget(
                isSelected: isSelected,
                filteredElement: DateFormat("dd/MM/yyyy").format(startDate),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if(isSelected) {
                  endDateFunc();
                }
              },
              child: SearchFilterElementWidget(
                isSelected: isSelected,
                filteredElement: DateFormat("dd/MM/yyyy").format(endDate),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
