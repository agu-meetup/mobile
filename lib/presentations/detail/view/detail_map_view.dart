import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class DetailMapView extends StatelessWidget {
  const DetailMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              mv.eventPlaceInfo,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GoogleMap(
                      markers: Set<Marker>.of(mv.markers.values),
                      initialCameraPosition: mv.initialLocation,
                      onMapCreated: (GoogleMapController controller) {
                        mv.mapController.complete(controller);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  mv.eventPlaceInfo,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(mv.eventCityInfo),
                SizedBox(height: 16),
                Row(
                  children: [
                    Image(
                      image: AssetImage(pinGray),
                    ),
                    SizedBox(width: 4),
                    Text(mv.eventAddress),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
