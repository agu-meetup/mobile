import 'dart:async';

import 'package:agu_meetup_mobile/core/assets.dart';
import 'package:agu_meetup_mobile/core/exceptions.dart';
import 'package:agu_meetup_mobile/domains/authentication/repository/authentication_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../components/my_dialogs/my_simple_dialog_widget.dart';
import '../../../data/authentication/models/sign_up_request_model.dart';
import '../../sign_in/view/sign_in_view.dart';

class SignUpModelView extends ChangeNotifier {
  AuthenticationRepository authenticationRepository = AuthenticationRepository();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  BuildContext? ctx;

  /// Update Context data
  void updateContextData(BuildContext context) {
    ctx = context;
  }

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
  bool passwordIsEyeOpen = true;

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

  void changePasswordEye(bool newEyeOpen) {
    passwordIsEyeOpen = newEyeOpen;
    notifyListeners();
  }

  /// Password Again Properties
  String passwordAgainHintText = "Password Again";
  String? passwordAgainVal;
  bool passwordAgainIsEyeOpen = true;

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

  void changePasswordAgainEye(bool newEyeOpen) {
    passwordAgainIsEyeOpen = newEyeOpen;
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

  List<String> genderList = const [
    "Male",
    "Female",
  ];
  void changeSelectedGender(String? selectedGender) {
    genderDropdownValue = selectedGender;
    notifyListeners();
  }

  /// Sign Up Button Properties
  Future<void> signUpButtonFunc() async {
    if (formKey.currentState!.validate()) {
      try {
        await authenticationRepository.signUp(SignUpRequestModel(
          name: nameVal!,
          surname: surnameVal!,
          phoneNumber: phoneNumVal!,
          email: emailVal!,
          password: passwordVal!,
          gender: genderDropdownValue!,
        ));
        await mySimpleDialogWidget(
          imagePath: successStar,
          context: ctx!,
          title: "Congratulations!",
          description:
              "Your account has been successfully created. You will be redirected to the homepage in a few seconds.",
        );
        Navigator.pushAndRemoveUntil(
            ctx!,
            MaterialPageRoute(
              builder: (_) => SignInView(),
            ),
            (route) => false);
      } catch (e) {
        if (e == EmailAlreadyUsed()) {
          print("Email is already used");
        } else {
          print("Hata");
        }
      }
    }
  }

  /// Sign In Text Button Properties
  void signInTextButtonFunc() {
    Navigator.pushAndRemoveUntil(
        ctx!,
        MaterialPageRoute(builder: (_) => const SignInView()),
        (route) => false);
  }
}
