import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/search/view/view/search_card_view.dart';
import 'package:agu_meetup_mobile/presentations/search/view/view/search_sort_field.dart';
import 'package:agu_meetup_mobile/presentations/search/view/view/search_text_field_view.dart';
import 'package:agu_meetup_mobile/presentations/search/view/widgets/search_filter_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../create_event/model_view/create_event_model_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CreateEventModelView>().updateBuildContext(context);

    const List<String> list = ['One'];
    String dropdownValue = list.first;
    double _currentSliderPrimaryValue = 0.2;
    double _currentSliderSecondaryValue = 0.5;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(child: SearchTextFieldView()),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,

                              ///give colors as constants by using their names to make dynamic rather than static.
                              colors: [Color(0xffFD7C88), Color(0xffFEB281)])),
                      child: IconButton(
                          onPressed: () {
                            showModalBottomSheet<dynamic>(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0))),
                              context: context,
                              builder: (BuildContext context) {
                                return Wrap(
                                  children: <Widget>[
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 170.0),
                                            child: Divider(
                                              color: kDarkGray,
                                              thickness: 3,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0,
                                                horizontal: 16.0),
                                            child: Divider(
                                              color: kDarkGray,
                                              thickness: 0.5,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 12, bottom: 12),
                                            child: Text(
                                              "Location",
                                              style: kSearchFilterTitle,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              FilterButton(
                                                  filterName: "Melikgazi"),
                                              FilterButton(
                                                  filterName: "Alpaslan"),
                                              FilterButton(filterName: "Talas")
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 12, bottom: 12),
                                            child: Text(
                                              "Categories",
                                              style: kSearchFilterTitle,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              FilterButton(filterName: "Spor"),
                                              FilterButton(filterName: "Müzik"),
                                              FilterButton(filterName: "Dans")
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 12, bottom: 12),
                                            child: Text(
                                              "Gender",
                                              style: kSearchFilterTitle,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              FilterButton(filterName: "All"),
                                              FilterButton(filterName: "Male"),
                                              FilterButton(filterName: "Female")
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 12, bottom: 12),
                                            child: Text(
                                              "Price",
                                              style: kSearchFilterTitle,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              FilterButton(filterName: "All"),
                                              FilterButton(filterName: "Free"),
                                              FilterButton(filterName: "Paid")
                                            ],
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 12, bottom: 12),
                                            child: Text(
                                              "Distance",
                                              style: kSearchFilterTitle,
                                            ),
                                          ),
                                          Slider(
                                            value: _currentSliderSecondaryValue,
                                            secondaryTrackValue:
                                                _currentSliderSecondaryValue,
                                            onChanged: (double value) {},
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 12, bottom: 12),
                                            child: Text(
                                              "Date",
                                              style: kSearchFilterTitle,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              FilterButton(filterName: "All"),
                                              FilterButton(filterName: "Today"),
                                              FilterButton(
                                                  filterName: "Tomorrow")
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.settings))),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(8.0),
                height: 50,
                child: const SearchSortDropdown()),
            const Expanded(child: SearchCardView()),
          ]),
        ),
      ),
    );
  }
}
