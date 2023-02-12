import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/create_event_selected_image_widget.dart';
import '../widget/create_event_upload_button_widget.dart';

class CreateEventImagesView extends StatelessWidget {
  const CreateEventImagesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(builder: (context, mv, child) {
      return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mv.selectedImages.length + 1,
          itemBuilder: (context, index) {
            if (index == mv.selectedImages.length) {
              return CreateEventUploadButtonWidget(
                onTabFunc: mv.uploadButtonFunc,
              );
            }
            return CreateEventSelectedImageWidget(
              selectedImagePath: mv.selectedImages[index].path,
            );
          },
        ),
      );
    });
  }
}
