import 'package:agu_meetup_mobile/presentations/search/view/view/search_sort_field.dart';
import 'package:agu_meetup_mobile/presentations/search/view/view/search_text_field_view.dart';
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
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,

                              ///give colors as constants by using their names to make dynamic rather than static.
                              colors: [
                                Color(0xffFD7C88),
                                Color(0xffFEB281)
                              ])),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.settings))),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(8.0),
                height: 50,
                child: SearchSortDropdown())
          ]),
        ),
      ),
    );
  }
}
