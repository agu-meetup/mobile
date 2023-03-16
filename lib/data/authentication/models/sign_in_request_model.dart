class SignInRequestModel {
  String email;
  String password;

  SignInRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "_password": password,
    };
  }
}
