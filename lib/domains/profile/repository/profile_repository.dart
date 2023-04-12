import 'package:agu_meetup_mobile/domains/event/repository/event_repository.dart';

import '../../../data/address/datasources/address_server_datasource.dart';
import '../../../data/address/model/get_address_response_model.dart';
import '../../../data/detail/datasources/detail_server_datasource.dart';
import '../../../data/detail/models/get_detail_by_id_response_model.dart';
import '../../../data/event/datasources/event_server_datasource.dart';
import '../../../data/event/models/get_event_response_model.dart';
import '../../../data/event/models/get_events_by_user_response_model.dart';
import '../../../presentations/profile/model/profile_event_model.dart';

class ProfileRepository {
  /// Data Layers
  EventServerDatasource eventServerDatasource = EventServerDatasource();
  AddressServerDatasource addressServerDatasource = AddressServerDatasource();
  DetailServerDatasource detailServerDatasource = DetailServerDatasource();

  /// Domain Layers
  EventRepository eventRepository = EventRepository();

  /// Event List Methods
  Future<List<ProfileEventModel>> getProfileMyEventList(int userId) async {
    List<ProfileEventModel> profileMyEventsList = [];
    List<GetEventsByUserResponseModel> getEventsByUserResponseModelList =
        await eventServerDatasource.getEventsByUser(userId);

    for (int i = 0; i < getEventsByUserResponseModelList.length; i++) {
      GetDetailByIdResponseModel getDetailByIdResponseModel =
          await detailServerDatasource
              .getDetailById(getEventsByUserResponseModelList[i].detailId);
      GetAddressResponseModel tempGetAddressResponseModel =
          await addressServerDatasource
              .getAddressByEventId(getEventsByUserResponseModelList[i].id);
      String tempDate = eventRepository
          .specificDateTranslate(getEventsByUserResponseModelList[i].startTime);

      String tempTime = eventRepository
          .specificTimeTranslate(getEventsByUserResponseModelList[i].startTime);

      String tempFirstImageLink = (await eventRepository
          .getAllImageLinks(getEventsByUserResponseModelList[i].imageUrl))[0];

      ProfileEventModel tempProfileEventModel = ProfileEventModel(
        eventId: getEventsByUserResponseModelList[i].id,
        eventDate: tempDate,
        eventTime: tempTime,
        eventDateByDateTime: getEventsByUserResponseModelList[i].startTime,
        eventPlace: tempGetAddressResponseModel.locationName,
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
    return profileMyEventsList;
  }

  Future<List<ProfileEventModel>> getUpcomingEventList(int userId) async {
    List<int> eventIdsJointFromCurrentUserList =
        await eventServerDatasource.getEventIdsJointUser(userId);
    List<ProfileEventModel> profileUpcomingEventList = [];
    for (int selectedEventId in eventIdsJointFromCurrentUserList) {
      GetEventResponseModel tempGetEventResponseModel =
          await eventServerDatasource.getEventById(selectedEventId);
      GetAddressResponseModel tempGetAddressResponseModel =
          await addressServerDatasource.getAddressByEventId(selectedEventId);

      String tempDate = eventRepository
          .specificDateTranslate(tempGetEventResponseModel.startTime);
      String tempTime = eventRepository
          .specificTimeTranslate(tempGetEventResponseModel.startTime);
      String tempFirstImageLink = (await eventRepository
          .getAllImageLinks(tempGetEventResponseModel.imageUrl))[0];

      ProfileEventModel tempProfileEventModel = ProfileEventModel(
        eventId: tempGetEventResponseModel.id,
        eventDate: tempDate,
        eventTime: tempTime,
        eventPlace: tempGetAddressResponseModel.locationName,
        eventTitle: tempGetEventResponseModel.title,
        numberCurrentMember: tempGetEventResponseModel.currentParticipants,
        numberMaxMember: tempGetEventResponseModel.maxParticipants,
        firstImagePath: tempFirstImageLink,
        eventDateByDateTime: tempGetEventResponseModel.startTime,
      );
      if (tempGetEventResponseModel.startTime.compareTo(DateTime.now()) > 0) {
        profileUpcomingEventList.add(tempProfileEventModel);
      }
    }
    profileUpcomingEventList
        .sort((a, b) => a.eventDateByDateTime.compareTo(b.eventDateByDateTime));
    return profileUpcomingEventList;
  }

  Future<List<ProfileEventModel>> getPastEventList(int userId) async {
    List<int> eventIdsJointFromCurrentUserList =
    await eventServerDatasource.getEventIdsJointUser(userId);
    print(
        "eventIdsJointFromCurrentUserList.length: ${eventIdsJointFromCurrentUserList.length}");
    List<ProfileEventModel> profilePastEventList = [];
    for (int selectedEventId in eventIdsJointFromCurrentUserList) {
      GetEventResponseModel tempGetEventResponseModel =
      await eventServerDatasource.getEventById(selectedEventId);
      GetAddressResponseModel tempGetAddressResponseModel =
      await addressServerDatasource.getAddressByEventId(selectedEventId);

      String tempDate = eventRepository
          .specificDateTranslate(tempGetEventResponseModel.startTime);
      String tempTime = eventRepository
          .specificTimeTranslate(tempGetEventResponseModel.startTime);
      String tempFirstImageLink = (await eventRepository
          .getAllImageLinks(tempGetEventResponseModel.imageUrl))[0];

      ProfileEventModel tempProfileEventModel = ProfileEventModel(
        eventId: tempGetEventResponseModel.id,
        eventDate: tempDate,
        eventTime: tempTime,
        eventPlace: tempGetAddressResponseModel.locationName,
        eventTitle: tempGetEventResponseModel.title,
        numberCurrentMember: tempGetEventResponseModel.currentParticipants,
        numberMaxMember: tempGetEventResponseModel.maxParticipants,
        firstImagePath: tempFirstImageLink,
        eventDateByDateTime: tempGetEventResponseModel.startTime,
      );
      if (tempGetEventResponseModel.startTime.compareTo(DateTime.now()) < 0) {
        profilePastEventList.add(tempProfileEventModel);
      }
    }
    profilePastEventList
        .sort((a, b) => a.eventDateByDateTime.compareTo(b.eventDateByDateTime));
    return profilePastEventList;
  }


  Future<List<ProfileEventModel>> getProfileBookmarksEventList() async {
    List<ProfileEventModel> profileBookmarksEventList = [];
    List<int> bookmarksEventIds = eventRepository.getBookmarksEventIds();
    for (int selectedEventId in bookmarksEventIds) {
      GetEventResponseModel tempGetEventResponseModel =
          await eventServerDatasource.getEventById(selectedEventId);
      GetAddressResponseModel tempGetAddressResponseModel =
          await addressServerDatasource.getAddressByEventId(selectedEventId);

      String tempDate = eventRepository
          .specificDateTranslate(tempGetEventResponseModel.startTime);
      String tempTime = eventRepository
          .specificTimeTranslate(tempGetEventResponseModel.startTime);
      String tempFirstImageLink = (await eventRepository
          .getAllImageLinks(tempGetEventResponseModel.imageUrl))[0];

      ProfileEventModel tempProfileEventModel = ProfileEventModel(
        eventId: tempGetEventResponseModel.id,
        eventDate: tempDate,
        eventTime: tempTime,
        eventPlace: tempGetAddressResponseModel.locationName,
        eventTitle: tempGetEventResponseModel.title,
        numberCurrentMember: tempGetEventResponseModel.currentParticipants,
        numberMaxMember: tempGetEventResponseModel.maxParticipants,
        firstImagePath: tempFirstImageLink,
        eventDateByDateTime: tempGetEventResponseModel.startTime,
      );
      profileBookmarksEventList.add(tempProfileEventModel);
    }
    profileBookmarksEventList
        .sort((a, b) => a.eventDateByDateTime.compareTo(b.eventDateByDateTime));
    return profileBookmarksEventList;
  }
}
