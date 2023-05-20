import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FilterButton extends StatelessWidget {
  String filterName;
  FilterButton({required this.filterName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        filterName,
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: kWhite,
      ),
    );
  }
}
