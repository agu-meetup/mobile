import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class SearchFilterElementWidget extends StatelessWidget {
  String filteredElement;
  bool isSelected;

  SearchFilterElementWidget({
    required this.filteredElement,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? null
            : [
          BoxShadow(
            color: kDarkGray,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: isSelected ? kOrange : Colors.transparent,
        ),
        color: isSelected ? Colors.transparent : kWhite,
      ),
      child: Center(
        child: Text(
          filteredElement,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
