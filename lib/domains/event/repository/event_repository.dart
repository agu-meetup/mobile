import 'package:agu_meetup_mobile/data/detail/datasources/detail_server_datasource.dart';
import 'package:agu_meetup_mobile/data/detail/models/get_detail_by_id_response_model.dart';
import 'package:agu_meetup_mobile/data/event/datasources/event_server_datasource.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';
import 'package:agu_meetup_mobile/data/event/models/get_event_response_model.dart';
import 'package:agu_meetup_mobile/data/event/models/get_events_by_user_response_model.dart';

import '../../../core/my_firebase_storage.dart';
import '../../../presentations/profile/model/profile_event_model.dart';

class EventRepository {
  /// Data Layers
  EventServerDatasource eventServerDatasource = EventServerDatasource();
  DetailServerDatasource detailServerDatasource = DetailServerDatasource();
  MyFirebaseStorage myFirebaseStorage = MyFirebaseStorage();

  /// Attibutes
  List<ProfileEventModel> profileMyEventsList = [];
  List<ProfileEventModel> profileUpcomingEventList = [];
  List<ProfileEventModel> profilePastEventList = [];

  Future<int> createEvent(
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
      if (i != createEventRequestModel.imageFiles.length - 1) {
        imageUrls += ",";
      }
    }

    Map<String, dynamic> eventImageInfoMap = {
      "imgUrl": imageUrls,
    };

    await eventServerDatasource.updateEventImageValue(
        eventImageInfoMap: eventImageInfoMap, eventId: createdEventId);
    return createdEventId;
  }

  Future<void> eventsCreatedCurrentUser(int userId) async {
    profileMyEventsList = [];
    List<GetEventsByUserResponseModel> getEventsByUserResponseModelList =
        await eventServerDatasource.getEventsByUser(userId);

    for (int i = 0; i < getEventsByUserResponseModelList.length; i++) {
      GetDetailByIdResponseModel getDetailByIdResponseModel =
          await detailServerDatasource
              .getDetailById(getEventsByUserResponseModelList[i].detailId);
      String tempDate =
          specificDateTranslate(getEventsByUserResponseModelList[i].startTime);

      String tempTime =
          specificTimeTranslate(getEventsByUserResponseModelList[i].startTime);

      String tempFirstImageLink = (await getAllImageLinks(
          getEventsByUserResponseModelList[i].imageUrl))[0];

      ProfileEventModel tempProfileEventModel = ProfileEventModel(
        eventId: getEventsByUserResponseModelList[i].id,
        eventDate: tempDate,
        eventTime: tempTime,
        eventDateByDateTime: getEventsByUserResponseModelList[i].startTime,
        eventPlace: "Caribou Cafe",
        eventTitle: getDetailByIdResponseModel.title,
        numberCurrentMember:
            getEventsByUserResponseModelList[i].currentParticipants,
        numberMaxMember: getEventsByUserResponseModelList[i].maxParticipants,
        firstImagePath: tempFirstImageLink,
      );
      profileMyEventsList.add(tempProfileEventModel);
    }
    profileMyEventsList
        .sort((a, b) => a.eventDateByDateTime.compareTo(b.eventDateByDateTime));
  }

  Future<void> eventsUpcomingAndPastCurrentUser(int userId) async {
    List<int> eventIdsJointFromCurrentUserList =
        await eventServerDatasource.getEventIdsJointUser(userId);
    print("eventIdsJointFromCurrentUserList.length: ${eventIdsJointFromCurrentUserList.length}");
    profileUpcomingEventList = [];
    profilePastEventList = [];
    for (int selectedEventId in eventIdsJointFromCurrentUserList) {
      GetEventResponseModel tempGetEventResponseModel =
          await eventServerDatasource.getEventById(selectedEventId);

      String tempDate =
      specificDateTranslate(tempGetEventResponseModel.startTime);
      String tempTime =
      specificTimeTranslate(tempGetEventResponseModel.startTime);
      String tempFirstImageLink =
      (await getAllImageLinks(tempGetEventResponseModel.imageUrl))[0];

      ProfileEventModel tempProfileEventModel = ProfileEventModel(
        eventId: tempGetEventResponseModel.id,
        eventDate: tempDate,
        eventTime: tempTime,
        eventPlace: "Caribou Cafe",
        eventTitle: tempGetEventResponseModel.title,
        numberCurrentMember: tempGetEventResponseModel.currentParticipants,
        numberMaxMember: tempGetEventResponseModel.maxParticipants,
        firstImagePath: tempFirstImageLink,
        eventDateByDateTime: tempGetEventResponseModel.startTime,
      );
      if (tempGetEventResponseModel.startTime.compareTo(DateTime.now()) > 0) {
        profileUpcomingEventList.add(tempProfileEventModel);
      }
      else {
        profilePastEventList.add(tempProfileEventModel);
      }
    }
    print("profileUpcomingEventList.length: ${profileUpcomingEventList.length}");
    profileUpcomingEventList
        .sort((a, b) => a.eventDateByDateTime.compareTo(b.eventDateByDateTime));
    profilePastEventList
        .sort((a, b) => a.eventDateByDateTime.compareTo(b.eventDateByDateTime));
  }

  /// Get Method domain -> repository
  List<ProfileEventModel> getProfileMyEventsListFromDomain() {
    return profileMyEventsList;
  }
  List<ProfileEventModel> getProfileUpcomingEventsListFromDomain() {
    return profileUpcomingEventList;
  }
  List<ProfileEventModel> getProfilePastEventsListFromDomain() {
    return profilePastEventList;
  }

  /// Required Methods for event repository
  String specificDateTranslate(DateTime date) {
    DateTime today = DateTime.now();
    DateTime tomorrow = today.add(const Duration(days: 1));
    if (date.day == today.day &&
        date.month == today.month &&
        date.year == today.year) {
      return "Today";
    } else if (date.day == tomorrow.day &&
        date.month == tomorrow.month &&
        date.year == tomorrow.year) {
      return "Tomorrow";
    }
    return "${date.day}/${date.month}/${date.year}";
  }

  String specificTimeTranslate(DateTime date) {
    return "${date.hour}:${date.minute}";
  }

  Future<List<String>> getAllImageLinks(String imagePaths) async {
    List<String> imageInfoList = imagePaths.split(",");
    String basePathForFirebase = imageInfoList[0];

    List<String> imagesPaths = [];

    for (int i = 1; i < imageInfoList.length; i++) {
      imagesPaths.add(basePathForFirebase + imageInfoList[i]);
    }

    List<String> imagesLinks = [];

    for (int i = 0; i < imagesPaths.length; i++) {
      imagesLinks.add(await myFirebaseStorage.takeImageUrl(imagesPaths[i]));
    }

    return imagesLinks;
  }
}
