class CreateEventRequestModel {
  int userId;
  String creatingTime;
  String startTime;
  String endTime;
  String users;
  double lattiude;
  double longitude;
  String name;
  String description;
  String title;
  String category;
  int maxParticipants;
  String hosts;
  String gender;
  String imageUrl;
  double price;

  CreateEventRequestModel({
    required this.userId,
    required this.creatingTime,
    required this.startTime,
    required this.endTime,
    required this.users,
    required this.lattiude,
    required this.longitude,
    required this.name,
    required this.description,
    required this.title,
    required this.category,
    required this.maxParticipants,
    required this.hosts,
    required this.gender,
    required this.imageUrl,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "creating_time": creatingTime,
      "start_time": startTime,
      "end_time": endTime,
      "users": users,
      "lattiude": lattiude,
      "longitude": longitude,
      "name": name,
      "description": description,
      "title": title,
      "category": category,
      "max_participants": maxParticipants,
      "hosts": hosts,
      "gender": gender,
      "imageUrl": imageUrl,
      "price": price,
    };
  }
}
