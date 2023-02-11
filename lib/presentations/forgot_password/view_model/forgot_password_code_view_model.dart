import 'package:agu_meetup_mobile/presentations/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordCodeViewModel extends ChangeNotifier {
  late BuildContext ctx;
  String? sentCodeTo;

  void updateBuildContext(BuildContext context) {
    ctx = context;
  }

  void updateSentCodeTo(String newSentCodeTo) {
    sentCodeTo = newSentCodeTo;
    notifyListeners();
  }

  FocusNode focusNode1 = FocusNode();
  String? code1 = "";
  bool isCode1Focused = false;
  void changeCode1(String? val) {
    code1 = val;
    if (focusNode1.hasFocus && val!.length == 1) {
      focusNode2.requestFocus();
    }
    notifyListeners();
  }

  FocusNode focusNode2 = FocusNode();
  String? code2 = "";
  bool isCode2Focused = false;
  void changeCode2(String? val) {
    code2 = val;
    if (focusNode2.hasFocus && val!.length == 1) {
      focusNode3.requestFocus();
    } else if (focusNode2.hasFocus && val!.isEmpty) {
      focusNode1.requestFocus();
    }
    notifyListeners();
  }

  FocusNode focusNode3 = FocusNode();
  String? code3 = "";
  bool isCode3Focused = false;
  void changeCode3(String? val) {
    code3 = val;
    if (focusNode3.hasFocus && val!.length == 1) {
      focusNode4.requestFocus();
    } else if (focusNode3.hasFocus && val!.isEmpty) {
      focusNode2.requestFocus();
    }
    notifyListeners();
  }

  FocusNode focusNode4 = FocusNode();
  String? code4 = "";
  bool isCode4Focused = false;
  void changeCode4(String? val) {
    code4 = val;
    if (focusNode4.hasFocus && val!.isEmpty) {
      focusNode3.requestFocus();
    }
    notifyListeners();
  }

  void startFocusListener() {
    focusNode1.addListener(() {
      isCode1Focused = focusNode1.hasFocus;
      notifyListeners();
    });
    focusNode2.addListener(() {
      isCode2Focused = focusNode2.hasFocus;
      notifyListeners();
    });
    focusNode3.addListener(() {
      isCode3Focused = focusNode3.hasFocus;
      notifyListeners();
    });
    focusNode4.addListener(() {
      isCode4Focused = focusNode4.hasFocus;
      notifyListeners();
    });
  }

  void verifyButtonFunc() {
    if (code1!.isNotEmpty &&
        code2!.isNotEmpty &&
        code3!.isNotEmpty &&
        code4!.isNotEmpty) {
      ctx.read<ForgotPasswordViewModel>().goNextPage();
    } else {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(const SnackBar(content: Text('Please full all blank')));
    }
  }
}
