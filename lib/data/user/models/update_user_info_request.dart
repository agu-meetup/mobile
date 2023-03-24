class UpdateUserInfoRequest {
  String name;
  String surname;
  String email;
  String phoneNumber;
  String gender;

  UpdateUserInfoRequest({
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "gender": gender,
      "name": name,
      "surname": surname,
      "phone_number": phoneNumber,
    };
  }
}
