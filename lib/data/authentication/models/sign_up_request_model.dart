class SignUpRequestModel {
  String name;
  String surname;
  String phoneNumber;
  String email;
  String password;
  String gender;

  SignUpRequestModel({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "phone_number": phoneNumber,
      "email": email,
      "_password": password,
      "gender": gender,
    };
  }
}
