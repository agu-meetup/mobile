import 'dart:convert';

import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';
import 'package:http/http.dart';

import '../../../core/exceptions.dart';
import '../models/get_event_response_model.dart';
import '../models/get_events_by_user_response_model.dart';

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

    if (response.statusCode == 200) {
      return;
    } else {
      throw UpdateEventError();
    }
  }

  Future<List<GetEventsByUserResponseModel>> getEventsByUser(int userId) async {
    Response response = await myService.getRequest(
      pathRequest: "api/event/user/$userId",
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['events'] as List<dynamic>)
          .map((e) => GetEventsByUserResponseModel.fromJson(e))
          .toList();
    } else {
      throw GetEventsByUserError();
    }
  }

  Future<List<int>> getEventIdsJointUser(int userId) async {
    Response response = await myService.getRequest(
      pathRequest: "api/event/userevents/$userId",
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['events'] as List<dynamic>)
          .map((e) => e['event_id'] as int)
          .toList();
    } else {
      throw GetEventIdsJointUserError();
    }
  }

  Future<GetEventResponseModel> getEventById(int eventId) async {
    Response response = await myService.getRequest(
      pathRequest: "api/event/$eventId",
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return GetEventResponseModel.fromJson(jsonDecode(response.body)['event']);
    } else {
      throw GetEventByIdError();
    }
  }

  Future<List<int>> getSaveEventsByUserId(int userId) async {
    Response response = await myService.getRequest(
      pathRequest: 'api/event/saveevent/$userId',
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body)['events'] as List)
          .map((e) => e['event_id'] as int)
          .toList();
    } else {
      throw GetSaveEventsByUserIdError();
    }
  }

  Future<void> addSaveEventByUserId({
    required int userId,
    required int eventId,
  }) async {
    Response response = await myService.postRequest(
      pathRequest: "api/event/saveevent/$userId",
      parameters: jsonEncode({'eventId': eventId}),
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw AddSaveEventsByUserIdError();
    }
  }

  Future<void> deleteSaveEventByUserId({
    required int userId,
    required int eventId,
  }) async {
    Response response = await myService.deleteRequest(
      pathRequest: "api/event/saveevent/$userId",
      parameters: jsonEncode({"eventId": eventId}),
      isRequiredToken: false,
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw DeleteSaveEventsByUserIdError();
    }
  }
  
  Future<void> deleteEventById({required int eventId}) async {
    Response response = await myService.deleteRequest(pathRequest: "api/event/$eventId", parameters: "", isRequiredToken: false,);

    if (response.statusCode == 200) {
      return;
    }
    else {
      throw DeleteEventsByEventIdError();
    }
  }
}
