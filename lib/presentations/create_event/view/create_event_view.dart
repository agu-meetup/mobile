import 'dart:io';

import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/assets.dart';
import '../widget/create_event_selected_image_widget.dart';
import '../widget/create_event_upload_button_widget.dart';
import 'create_event_detail_text_view.dart';
import 'create_event_details_view.dart';
import 'create_event_images_view.dart';
import 'create_event_price_view.dart';
import 'create_event_qouta_and_gender_view.dart';
import 'create_event_select_date_view.dart';
import 'create_event_select_location_view.dart';
import 'create_event_select_time_view.dart';
import 'create_event_title_view.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CreateEventModelView>().updateBuildContext(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<CreateEventModelView>(
            builder: (context, mv, child) {
              return ListView(
                children: [
                  CreateEventImagesView(),
                  SizedBox(height: 25),
                  CreateEventDetailTextView(),
                  SizedBox(height: 32),
                  CreateEventTitleView(),
                  SizedBox(height: 25),
                  CreateEventSelectLocationView(),
                  SizedBox(height: 32),
                  CreateEventSelectDateView(),
                  SizedBox(height: 24),
                  CreateEventSelectTimeView(),
                  SizedBox(height: 24),
                  CreateEventDetailsView(),
                  SizedBox(height: 24),
                  CreateEventQuotaAndGenderView(),
                  SizedBox(height: 24),
                  CreateEventPriceView(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
