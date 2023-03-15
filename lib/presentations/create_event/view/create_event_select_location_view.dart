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
                  image: mv.imageBytes != null
                      ? DecorationImage(
                          image: MemoryImage(mv.imageBytes!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Center(
                  child: mv.imageBytes == null ? Text('Select Location') : null,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                mv.addressSelectedLocation != null
                    ? Image(image: AssetImage(pinGray))
                    : Container(),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    mv.addressSelectedLocation ?? "",
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            MyTextFieldWidget(
              hintText: "Enter Place Name",
              changeValueFunc: (val) {},
              isThereShadow: false,
              controller: mv.placeNameCtr,
            ),
          ],
        );
      },
    );
  }
}
