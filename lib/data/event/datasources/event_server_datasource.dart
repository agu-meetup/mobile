import 'dart:convert';

import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';
import 'package:http/http.dart';

import '../../../core/exceptions.dart';

class EventServerDatasource {
  MyService myService = MyService();

  Future<void> createEvent(CreateEventRequestModel createEventRequestModel) async {
    Response response = await myService.postRequest(
      pathRequest: "api/event",
      parameters: jsonEncode(createEventRequestModel.toJson()),
      isRequiredToken: false,
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 201) {
      return;
    }
    else {
      throw CreateEventError();
    }
  }
}
