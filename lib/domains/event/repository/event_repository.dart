import 'package:agu_meetup_mobile/data/event/datasources/event_server_datasource.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';

import '../../../core/my_firebase_storage.dart';

class EventRepository {
  /// Data Layers
  EventServerDatasource eventServerDatasource = EventServerDatasource();
  MyFirebaseStorage myFirebaseStorage = MyFirebaseStorage();

  /// Attibutes


  Future<void> createEvent(
      CreateEventRequestModel createEventRequestModel) async {
    int createdEventId =
        await eventServerDatasource.createEvent(createEventRequestModel);

    String imageUrls = "Events/$createdEventId/,";
    for (int i = 0; i < createEventRequestModel.imageFiles.length; i++) {
      await myFirebaseStorage.updateImage(
        "Events",
        createEventRequestModel.imageFiles[i],
        createdEventId.toString(),
        (i + 1),
      );
      imageUrls += "${i + 1}.jpg";
      if (i != createEventRequestModel.imageFiles.length - 1){
        imageUrls += ",";
      }
    }

    Map<String, dynamic> eventImageInfoMap = {
      "imgUrl": imageUrls,
    };

    await eventServerDatasource.updateEventImageValue(eventImageInfoMap: eventImageInfoMap, eventId: createdEventId);
  }


}
