import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventHostsView extends StatelessWidget {
  const CreateEventHostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateEventModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'HOSTS',
                style: TextStyle(
                  fontSize: 12,
                  color: kDarkGray,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mv.hostsControllers.length + 1,
                itemBuilder: (context, index) {
                  if (index == mv.hostsControllers.length) {
                    return GestureDetector(
                      onTap: () {
                        mv.addNewHostValue();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: kDarkGray),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: kDarkGray,
                            size: 36,
                          ),
                        ),
                      ),
                    );
                  }
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        width: SizeConfig.screenWidth! / 3,
                        child: MyTextFieldWidget(
                          hintText: 'Host name',
                          controller: mv.hostsControllers[index],
                          isThereShadow: false,
                          changeValueFunc: (val) {},
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            mv.removeHostValue(index);
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.clear,
                                color: kWhite,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
