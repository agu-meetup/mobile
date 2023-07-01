import 'package:agu_meetup_mobile/domains/event/model/event_info_model.dart';
import 'package:agu_meetup_mobile/core/functions.dart';

class HomeEventModel {
  int eventId;
  String eventDate;
  String eventTime;
  String eventPlace;
  String eventTitle;
  int currentMember;
  int maxMember;
  String firstImage;

  HomeEventModel({
    required this.eventId,
    required this.eventDate,
    required this.eventTime,
    required this.eventPlace,
    required this.eventTitle,
    required this.currentMember,
    required this.maxMember,
    required this.firstImage,
  });

  factory HomeEventModel.fromEventInfoModel(EventInfoModel eventInfoModel) {
    return HomeEventModel(
      eventId: eventInfoModel.id,
      eventDate: dateTimeToDateString(eventInfoModel.startTime),
      eventTime: dateTimeToTimeString(eventInfoModel.startTime),
      eventPlace: eventInfoModel.eventAddress.locationName,
      eventTitle: eventInfoModel.eventDetail.title,
      currentMember: eventInfoModel.currentParticipants,
      maxMember: eventInfoModel.maxParticipants,
      firstImage: eventInfoModel.imageUrls[0],
    );
  }
}
