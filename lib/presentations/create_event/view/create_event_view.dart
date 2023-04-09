import 'dart:io';

import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_loadings/my_loading_widget.dart';
import '../../../core/assets.dart';
import '../widget/create_event_selected_image_widget.dart';
import '../widget/create_event_upload_button_widget.dart';
import 'create_event_button_view.dart';
import 'create_event_category_view.dart';
import 'create_event_detail_text_view.dart';
import 'create_event_details_view.dart';
import 'create_event_hosts_view.dart';
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
    context.read<CreateEventModelView>().initialMethods();
    return SafeArea(
      child: Scaffold(
        body: Consumer<CreateEventModelView>(
          builder: (context, mv, child) {
            if (mv.isPageLoaded == false) {
              return const Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IgnorePointer(
                    ignoring: mv.isEventAddedSituation,
                    child: Opacity(
                      opacity: mv.isEventAddedSituation ? 0.5 : 1,
                      child: ListView(
                        children: const [
                          CreateEventImagesView(),
                          SizedBox(height: 25),
                          CreateEventDetailTextView(),
                          SizedBox(height: 32),
                          CreateEventTitleView(),
                          SizedBox(height: 24),
                          CreateEventDetailsView(),
                          SizedBox(height: 25),
                          CreateEventSelectLocationView(),
                          SizedBox(height: 32),
                          CreateEventSelectDateView(),
                          SizedBox(height: 24),
                          CreateEventSelectTimeView(),
                          SizedBox(height: 24),
                          CreateEventQuotaAndGenderView(),
                          SizedBox(height: 24),
                          CreateEventCategoryView(),
                          SizedBox(height: 24),
                          CreateEventPriceView(),
                          SizedBox(height: 24),
                          CreateEventHostsView(),
                          SizedBox(height: 24),
                          CreateEventButtonView(),
                        ],
                      ),
                    ),
                  ),
                ),
                mv.isEventAddedSituation
                    ? Center(
                        child: MyLoadingWidget(
                          size: SizeConfig.screenWidth! / 4,
                          color: kOrange,
                        ),
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
