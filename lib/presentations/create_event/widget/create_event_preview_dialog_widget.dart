import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/components/my_carousel/my_carousel_indicator_widget.dart';
import 'package:agu_meetup_mobile/components/my_carousel/my_carousel_slider_widget.dart';
import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model/create_event_info_model.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> createEventPreviewDialogWidget({
  required BuildContext context,
  required CreateEventInfoModel createEventInfoModel,
  required Function updateSliderImageIndex,
  required Function previewFinishButton,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      context
          .read<CreateEventModelView>()
          .updatePreviewDialogBuildContext(context);
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          width: SizeConfig.screenWidth! - 32,
          height: SizeConfig.screenHeight! - 64,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 24,
                    width: 24,
                  ),
                  const Text(
                    'Preview',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image(
                      image: AssetImage(closeRed),
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    // Carousel Images
                    MyCarouselSliderWidget(
                      updateImageIndexFunc: updateSliderImageIndex,
                      widthOfSlider: SizeConfig.screenWidth! - 32,
                      imageFilePaths: createEventInfoModel.selectedImages
                          .map((e) => e.path)
                          .toList(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Consumer<CreateEventModelView>(
                        builder: (context, mv, child) {
                          return MyCarouselIndicatorWidget(
                            lengthOfImages:
                                createEventInfoModel.selectedImages.length,
                            imageIndex: mv.sliderImageIndex,
                          );
                        },
                      ),
                    ),

                    // Title And Detail
                    Text(
                      createEventInfoModel.titleCtr.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      createEventInfoModel.detailCtr.text,
                      style: TextStyle(
                        fontSize: 14,
                        color: kDarkGray,
                      ),
                    ),

                    const SizedBox(height: 16),
                    // Map Image
                    Container(
                      height: SizeConfig.screenWidth! / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            image:
                                MemoryImage(createEventInfoModel.imageBytes!),
                            fit: BoxFit.cover,
                          )),
                    ),

                    const SizedBox(height: 8),
                    // Location Info
                    Row(
                      children: [
                        Image(image: AssetImage(pinGray)),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            createEventInfoModel.addressSelectedLocation!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    // Date and time
                    Row(
                      children: [
                        Icon(Icons.date_range, color: kGray, size: 20),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                createEventInfoModel
                                    .dateSelectorController.text,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${createEventInfoModel.startTimeController.text} - ${createEventInfoModel.endTimeController.text}",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kBeige,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    // Date and time
                    Row(
                      children: [
                        Icon(Icons.person_add_alt_1, color: kGray, size: 20),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "${createEventInfoModel.quotaCtr.text} quota",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image(
                          image: AssetImage(allGender),
                          height: 20,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          createEventInfoModel.genderDropdownValue!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.category,
                          color: kGray,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          createEventInfoModel.categoryDropdownValue!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: kGray,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          createEventInfoModel.isFree
                              ? 'Free'
                              : '${createEventInfoModel.priceCtr.text} TL',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: kGray,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            createEventInfoModel.allHostsText!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MyButtonWidget(
                buttonText: 'CREATE',
                buttonTextColor: Colors.white,
                backgroundColor: kOrange,
                onTapFunction: previewFinishButton,
              ),
            ],
          ),
        ),
      );
    },
  );
}
