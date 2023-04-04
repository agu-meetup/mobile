class GetDetailByIdResponseModel {
  int id;
  String title;

  GetDetailByIdResponseModel({
    required this.id,
    required this.title,
  });

  factory GetDetailByIdResponseModel.fromJson(Map map) {
    return GetDetailByIdResponseModel(
      id: map['id'] as int,
      title: map['title'],
    );
  }
}
