class ProfileEventModel {
  int eventId;
  String eventDate;
  String eventTime;
  String eventPlace;
  String eventTitle;
  int numberCurrentMember;
  int numberMaxMember;

  ProfileEventModel({
    required  this.eventId,
    required this.eventDate,
    required this.eventTime,
    required this.eventPlace,
    required this.eventTitle,
    required this.numberCurrentMember,
    required this.numberMaxMember,
  });
}
