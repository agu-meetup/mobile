class SearchCardModel {
  int id;
  String notificationTitle;
  String eventTitle;
  String date;
  String time;
  String locationName;
  String city;
  SearchCardModel(
      {required this.id,
      required this.notificationTitle,
      required this.eventTitle,
      required this.date,
      required this.time,
      required this.locationName,
      required this.city});
}
