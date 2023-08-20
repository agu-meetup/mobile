class EventInfoModel {
  int id;
  int currentParticipants;
  int maxParticipants;
  DateTime startTime;
  DateTime endTime;
  List<String> hosts;
  String gender;
  List<String> imageUrls;
  int price;
  EventDetailInfoModel eventDetail;
  EventUserInfoModel eventUser;
  EventLocationInfoModel eventLocation;
  EventAddressInfoModel eventAddress;

  EventInfoModel({
    required this.id,
    required this.currentParticipants,
    required this.maxParticipants,
    required this.startTime,
    required this.endTime,
    required this.hosts,
    required this.gender,
    required this.imageUrls,
    required this.price,
    required this.eventDetail,
    required this.eventUser,
    required this.eventLocation,
    required this.eventAddress,
  });

  factory EventInfoModel.fromMap(Map map) {
    return EventInfoModel(
      id: map['id'] as int,
      currentParticipants: map['current_participants'] as int,
      maxParticipants: map['max_participants'] as int,
      startTime: DateTime.parse(map['start_time']),
      endTime: DateTime.parse(map['end_time']),
      hosts: (map['hosts'] as String).split("-"),
      gender: map['gender'],
      imageUrls: [],
      price: map['price'] as int,
      eventDetail: EventDetailInfoModel.fromMap(map['eventDetail']),
      eventUser: EventUserInfoModel.fromMap(map['eventUser']),
      eventLocation: EventLocationInfoModel.fromMap(map['eventLocation']),
      eventAddress: EventAddressInfoModel.fromMap(map['eventAddress']),
    );
  }
}

class EventDetailInfoModel {
  int id;
  String title;
  String description;
  String category;

  EventDetailInfoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  factory EventDetailInfoModel.fromMap(Map map) {
    return EventDetailInfoModel(
      id: map['id'] as int,
      title: map['title'],
      description: map['description'],
      category: map['category'],
    );
  }
}

class EventUserInfoModel {
  int id;
  String name;
  String surname;
  String email;
  String phoneNumber;
  String gender;

  EventUserInfoModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    required this.gender,
  });

  factory EventUserInfoModel.fromMap(Map map) {
    return EventUserInfoModel(
      id: map['id'] as int,
      name: map['name'],
      surname: map['surname'],
      email: map['email'],
      phoneNumber: map['phone_number'],
      gender: map['gender'],
    );
  }
}

class EventLocationInfoModel {
  int locationId;
  double latitude;
  double longitude;

  EventLocationInfoModel({
    required this.locationId,
    required this.latitude,
    required this.longitude,
  });

  factory EventLocationInfoModel.fromMap(Map map) {
    return EventLocationInfoModel(
      locationId: map['id'] as int,
      latitude: map['lattiude'] as double,
      longitude: map['longitude'] as double,
    );
  }
}

class EventAddressInfoModel {
  int id;
  String country;
  String forDirection;
  String locationName;
  String province;
  String district;
  String subLocality;

  EventAddressInfoModel({
    required this.id,
    required this.country,
    required this.forDirection,
    required this.locationName,
    required this.province,
    required this.district,
    required this.subLocality,
  });

  factory EventAddressInfoModel.fromMap(Map map) {
    return EventAddressInfoModel(
      id: map['id'] as int,
      country: map['country'],
      forDirection: map['forDirection'],
      locationName: map['locationName'],
      province: map['province'],
      district: map['district'],
      subLocality: map['subLocality'],
    );
  }
}
