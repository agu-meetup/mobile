import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../sign_in/presentation/view/sign_in_view.dart';

class SignUpModelView extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Name field Properties
  String nameHintText = "Name";
  String? nameVal;
  String? nameValidatorFunc(String? val) {
    if (val == null || val == "") {
      return "Please don't leave blank.";
    }
    return null;
  }

  void changeNameVal(String? newNameVal) {
    nameVal = newNameVal;
  }

  /// Surname field Properties
  String surnameHintText = "Surname";
  String? surnameVal;
  String? surnameValidatorFunc(String? val) {
    if (val == null || val == "") {
      return "Please don't leave blank.";
    }
    return null;
  }

  void changeSurnameVal(String? newSurnameVal) {
    surnameVal = newSurnameVal;
  }

  /// Email field Properties
  String emailHintText = "E-mail";
  String? emailVal;
  TextInputType emailTextInputType = TextInputType.emailAddress;
  String? emailValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter valid email";
    }
    if (!EmailValidator.validate(val)) {
      return "Please enter valid email";
    }
    return null;
  }

  void changeEmailVal(String? newEmailVal) {
    emailVal = newEmailVal;
  }

  /// Password Properties
  String passwordHintText = "Password";
  String? passwordVal;
  final isEyeOpenController1 = StreamController<bool>.broadcast();
  Stream<bool> isEyeOpenStream1() async* {
    yield true;
    yield* isEyeOpenController1.stream;
  }

  void changePasswordVal(String? newPasswordVal) {
    passwordVal = newPasswordVal;
  }

  String? passwordValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter password more 6 character";
    }
    if (val.length < 6) {
      return "Please enter password more 6 character";
    }
    return null;
  }

  void changePasswordEye1(bool newEyeOpen) {
    isEyeOpenController1.add(newEyeOpen);
    notifyListeners();
  }

  /// Password Again Properties
  String passwordAgainHintText = "Password Again";
  String? passwordAgainVal;
  final isEyeOpenController2 = StreamController<bool>.broadcast();
  Stream<bool> isEyeOpenStream2() async* {
    yield true;
    yield* isEyeOpenController2.stream;
  }

  void changePasswordAgainVal(String? newPasswordAgainVal) {
    passwordAgainVal = newPasswordAgainVal;
  }

  String? passwordAgainValidatorFunc(String? val) {
    if (val == null) {
      return "Please enter password more 6 character";
    }
    if (val.length < 6) {
      return "Please enter password more 6 character";
    }
    if (passwordVal != passwordAgainVal) {
      return "Please enter same password";
    }
    return null;
  }

  void changePasswordEye2(bool newEyeOpen) {
    isEyeOpenController2.add(newEyeOpen);
    notifyListeners();
  }

  /// Phone number text field
  String phoneNumHintText = "Phone number (optional)";
  String? phoneNumVal;
  TextInputType phoneNumInputType = TextInputType.number;
  void changePhoneNumVal(String? newPhoneNumVal) {
    phoneNumVal = newPhoneNumVal;
  }

  /// Gender Selection
  String? genderDropdownValue;
  final genderDropdownController = StreamController<String?>.broadcast();
  Stream<String?> genderDropdownStream() async* {
    yield genderDropdownValue;
    yield* genderDropdownController.stream;
  }

  List<String> genderList = const [
    "Male",
    "Female",
  ];
  void changeSelectedGender(String? selectedGender) {
    genderDropdownValue = selectedGender;
    genderDropdownController.add(selectedGender);
    notifyListeners();
  }

  /// Sign Up Button Properties
  void signUpButtonFunc() {
    if (formKey.currentState!.validate()) {
      print("Let\'s sign up");
    }
  }

  /// Sign In Text Button Properties
  void signInTextButtonFunc(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignInView()),
        (route) => false);
  }
}
