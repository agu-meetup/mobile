class GetEventResponseModel {
  int id;
  DateTime startTime;
  DateTime endTime;
  String gender;
  String imageUrl;
  int price;
  String hosts;
  int maxParticipants;
  int currentParticipants;
  double lattiude;
  double longitude;
  String title;
  String description;
  String category;
  String users;

  GetEventResponseModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.gender,
    required this.imageUrl,
    required this.price,
    required this.hosts,
    required this.maxParticipants,
    required this.currentParticipants,
    required this.lattiude,
    required this.longitude,
    required this.title,
    required this.description,
    required this.category,
    required this.users,
  });

  factory GetEventResponseModel.fromJson(Map map) {
    return GetEventResponseModel(
      id: int.parse(map['id']),
      startTime: DateTime.parse(map['start_time']),
      endTime: DateTime.parse(map['end_time']),
      gender: map['gender'],
      imageUrl: map['imageUrl'],
      price: map['price'] as int,
      hosts: map['hosts'],
      maxParticipants: map['max_participants'] as int,
      currentParticipants: map['current_participants'] as int,
      lattiude: map['lattiude'] as double,
      longitude: map['longitude'] as double,
      title: map['title'],
      description: map['description'],
      category: map['category'],
      users: map['users'],
    );
  }
}
