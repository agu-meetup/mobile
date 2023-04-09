class DetailInfoModel {
  int eventId;
  String title;
  String detail;
  String price;
  List<String> hosts;
  List<String> imageLinks;
  String eventDate;
  String startTime;
  String endTime;
  String locationName;
  String province;
  String district;
  String subLocality;
  String forDirection;
  int currentParticipants;
  int maxParticipants;
  double lattiude;
  double longitude;
  String gender;

  DetailInfoModel({
    required this.eventId,
    required this.title,
    required this.detail,
    required this.price,
    required this.hosts,
    required this.imageLinks,
    required this.eventDate,
    required this.startTime,
    required this.endTime,
    required this.locationName,
    required this.province,
    required this.district,
    required this.subLocality,
    required this.forDirection,
    required this.currentParticipants,
    required this.maxParticipants,
    required this.lattiude,
    required this.longitude,
    required this.gender,
  });
}
