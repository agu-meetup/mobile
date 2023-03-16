class GetUserInfoResponseModel {
  int id;
  String name;
  String surname;
  String email;
  String phoneNumber;
  String gender;

  GetUserInfoResponseModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    required this.gender,
  });

  factory GetUserInfoResponseModel.fromJson(Map map) {
    return GetUserInfoResponseModel(
      id: map['id'] as int,
      email: map['email'],
      gender: map['gender'],
      name: map['name'],
      surname: map['surname'],
      phoneNumber: map['phone_number'],
    );
  }
}
