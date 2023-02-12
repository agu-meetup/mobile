import 'package:agu_meetup_mobile/components/my_buttons/my_text_button_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventModelView extends ChangeNotifier {
  late BuildContext ctx;
  final ImagePicker _picker = ImagePicker();
  XFile? photo;
  List<XFile> selectedImages = [];

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  String? eventTitleVal;
  void changeEventTitle(String? val) {
    eventTitleVal = eventTitleVal;
  }

  void uploadButtonFunc() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: ctx,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyTextButtonWidget(
                  text: 'From Gallery',
                  onTanFunc: () async {
                    photo =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (photo != null) {
                      selectedImages.add(photo!);
                    }
                    notifyListeners();
                  },
                ),
                MyTextButtonWidget(
                  text: 'From Camera',
                  onTanFunc: () async {
                    photo = await _picker.pickImage(source: ImageSource.camera);
                    if (photo != null) {
                      selectedImages.add(photo!);
                    }
                    notifyListeners();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
