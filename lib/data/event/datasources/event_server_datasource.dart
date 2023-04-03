import 'dart:convert';

import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';
import 'package:http/http.dart';

import '../../../core/exceptions.dart';

class EventServerDatasource {
  MyService myService = MyService();

  Future<int> createEvent(
      CreateEventRequestModel createEventRequestModel) async {
    Response response = await myService.postRequest(
      pathRequest: "api/event",
      parameters: jsonEncode(createEventRequestModel.toJson()),
      isRequiredToken: false,
    );

    print(response.statusCode);
    print(response.body);

    Map<String, dynamic> responseMap = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return responseMap["event"]["id"] as int;
    } else {
      throw CreateEventError();
    }
  }

  Future<void> updateEventImageValue({
    required Map<String, dynamic> eventImageInfoMap,
    required int eventId,
  }) async {
    Response response = await myService.putRequest(
      pathRequest: "api/event/$eventId/image",
      parameters: jsonEncode(eventImageInfoMap),
      isRequiredToken: false,
    );

    if (response.statusCode == 200){
      return;
    }
    else {
      throw UpdateEventError();
    }
  }
}
