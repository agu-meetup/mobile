import 'package:agu_meetup_mobile/presentations/detail/view/detail_view.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Detail Page Example'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const DetailView()));
          },
        ),
      ),
    );
  }
}
