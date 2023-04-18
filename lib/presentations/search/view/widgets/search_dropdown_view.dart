import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../core/constants.dart';

class SearchDropdown extends StatelessWidget {
  String? dropdownValue;
  List<String> elementList;
  Function onChangedFunc;
  bool isThereShadow;
  String hintText;

  SearchDropdown({
    required this.dropdownValue,
    required this.elementList,
    required this.onChangedFunc,
    required this.hintText,
    this.isThereShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        boxShadow: isThereShadow
            ? [
                const BoxShadow(
                    color: Colors.grey,
                    blurRadius: 8,
                    offset: Offset(0.0, 0.75))
              ]
            : [],
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: Text(hintText),
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        elevation: 16,
        style: TextStyle(color: kDarkGray),
        onChanged: (String? value) {
          onChangedFunc(value);
        },
        isExpanded: true,
        underline: Container(),
        items: elementList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
