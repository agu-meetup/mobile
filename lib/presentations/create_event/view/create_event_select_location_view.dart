import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:agu_meetup_mobile/presentations/create_event/view/create_event_maps_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CreateEventSelectLocationView extends StatelessWidget {
  const CreateEventSelectLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'LOCATION',
                style: TextStyle(
                  color: kDarkGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                mv.openMapButton();
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: kDarkGray),
                  image: mv.createEventInfoModel.imageBytes != null
                      ? DecorationImage(
                          image:
                              MemoryImage(mv.createEventInfoModel.imageBytes!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Center(
                  child: mv.createEventInfoModel.imageBytes == null
                      ? Text('Select Location')
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on, size: 32, color: kOrange),
                            const SizedBox(height: 24),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                mv.createEventInfoModel.targetPosition != null
                    ? Icon(
                        Icons.location_city,
                        color: kGray,
                      )
                    : Container(),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    mv.createEventInfoModel.targetPosition != null
                        ? "${mv.createEventInfoModel.subCity}/${mv.createEventInfoModel.city}"
                        : "",
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            mv.createEventInfoModel.targetPosition != null
                ? Column(
                    children: [
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sub locality, Street, No',
                          style: TextStyle(
                            color: kDarkGray,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      MyTextFieldWidget(
                        hintText: "Sub locality, street, no",
                        changeValueFunc: (val) {},
                        isThereShadow: false,
                        controller: mv.createEventInfoModel.locationAddressCtr,
                      ),
                      const SizedBox(height: 8),
                      MyTextFieldWidget(
                        hintText: "For directions (optional)",
                        changeValueFunc: (val) {},
                        isThereShadow: false,
                        controller: mv.createEventInfoModel.forDirectionsCtr,
                        specificSuffixIcon: Icon(
                          Icons.directions,
                          color: kGray,
                        ),
                      ),
                      const SizedBox(height: 8),
                      MyTextFieldWidget(
                        hintText: "Enter Place Name",
                        changeValueFunc: (val) {},
                        isThereShadow: false,
                        controller: mv.createEventInfoModel.placeNameCtr,
                        specificSuffixIcon:
                            Icon(Icons.home_filled, color: kGray),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
