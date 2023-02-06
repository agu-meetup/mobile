class SignUpRequestModel {
  String name;
  String surname;
  String phoneNumber;
  String email;
  String password;

  SignUpRequestModel({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "phone_number": phoneNumber,
      "email": email,
      "_password": password,
    };
  }
}
