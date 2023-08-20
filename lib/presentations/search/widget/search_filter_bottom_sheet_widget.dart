import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../model_view/model_view.dart';
import '../widget/widget.dart';

void searchFilterBottomSheet({
  required BuildContext ctx,
}) {
  showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: ctx,
    builder: (BuildContext context) {
      return Consumer<SearchModelView>(
        builder: (context, mv, child) {
          return Container(
            height: SizeConfig.screenHeight! * 4 / 5,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  width: SizeConfig.screenWidth! / 4,
                  decoration: BoxDecoration(
                    color: kDarkGray,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    height: 24,
                    color: kGray,
                    thickness: 2,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SearchFilterListWidget(
                        filterTitle: "Locations",
                        filterList: mv.locations,
                        selectedValue: mv.locationFilterValue,
                        selectionFunc: mv.changeLocationFilterValue,
                      ),
                      const SizedBox(height: 12),
                      SearchFilterListWidget(
                        filterTitle: "Categories",
                        filterList: mv.categories,
                        selectedValue: mv.categoryFilterValue,
                        selectionFunc: mv.changeCategoryFilterValue,
                      ),
                      const SizedBox(height: 12),
                      SearchFilterListWidget(
                        filterTitle: "Genders",
                        filterList: mv.genders,
                        selectedValue: mv.genderFilterValue,
                        selectionFunc: mv.changeGenderFilterValue,
                      ),
                      const SizedBox(height: 12),
                      SearchFilterListWidget(
                        filterTitle: "Price",
                        filterList: mv.prices,
                        selectedValue: mv.priceFilterValue,
                        selectionFunc: mv.changePriceFilterValue,
                      ),
                      const SizedBox(height: 12),
                      SearchFilterListWidget(
                        filterTitle: "Date",
                        filterList: mv.dates,
                        selectedValue: mv.dateFilterValue,
                        selectionFunc: mv.changeDateFilterValue,
                      ),
                      SearchFilterDateWidget(
                        startDate: mv.datesMap["StartDate"]!,
                        endDate: mv.datesMap["EndDate"]!,
                        isSelected: mv.dateFilterValue == "Selected Date",
                        startDateFunc: mv.selectStartDateFunc,
                        endDateFunc: mv.selectEndDateFunc,

                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
