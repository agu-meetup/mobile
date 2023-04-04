class GetEventsByUserResponseModel {
  int id;
  DateTime startTime;
  int detailId;
  int currentParticipants;
  int maxParticipants;
  String imageUrl;

  GetEventsByUserResponseModel({
    required this.id,
    required this.startTime,
    required this.detailId,
    required this.currentParticipants,
    required this.maxParticipants,
    required this.imageUrl,
  });

  factory GetEventsByUserResponseModel.fromJson(Map map) {
    return GetEventsByUserResponseModel(
      id: map['id'] as int,
      startTime: DateTime.parse(map['start_time']),
      detailId: map['detail_id'] as int,
      currentParticipants: map['current_participants'] as int,
      maxParticipants: map['max_participants'] as int,
      imageUrl: map['imageUrl'],
    );
  }
}
