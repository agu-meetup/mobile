import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/create_event/model_view/create_event_model_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class CreateEventMapsView extends StatelessWidget {
  const CreateEventMapsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Event Location',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            context.read<CreateEventModelView>().clearTargetPosition();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Consumer<CreateEventModelView>(
        builder: (context, mv, child) {
          if (mv.currentPosition == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                initialCameraPosition: mv.initialLocation,
                onMapCreated: (GoogleMapController controller) {
                  mv.mapController.complete(controller);
                },
                onCameraMove: (position) {
                  mv.updateTargetPosition(position.target);
                },
              ),
              Positioned(
                bottom: 16,
                left: SizeConfig.screenWidth! / 4,
                child: SizedBox(
                  width: SizeConfig.screenWidth! / 2,
                  child: MyButtonWidget(
                    buttonText: 'Select Location',
                    buttonTextColor: Colors.white,
                    backgroundColor: kNavyBlue,
                    onTapFunction: () async {
                      await mv.selectPlaceButtonFunc();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -16),
                child: Icon(
                  Icons.location_pin,
                  color: kOrange,
                  size: 40,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
