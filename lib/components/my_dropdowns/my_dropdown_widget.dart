import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';

class MyDropdownWidget extends StatelessWidget {
  String? dropdownValue;
  List<String> elementList;
  Function onChangedFunc;

  MyDropdownWidget({
    required this.dropdownValue,
    required this.elementList,
    required this.onChangedFunc,
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
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        hint: Text("Gender"),
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
