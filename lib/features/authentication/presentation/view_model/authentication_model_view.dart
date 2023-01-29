import 'dart:async';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

enum AuthenticationStatus {
  loading,
  authenticated,
  unauthenticated,
}

class AuthenticationModelView extends ChangeNotifier {
  String? token;
  final _authenticationStatusController =
      StreamController<AuthenticationStatus>.broadcast();
  AuthenticationStatus _authenticationStatus = AuthenticationStatus.loading;

  Stream<AuthenticationStatus> get authStatus async* {
    if (_authenticationStatus == AuthenticationStatus.authenticated) {
      yield AuthenticationStatus.authenticated;
    } else if (_authenticationStatus == AuthenticationStatus.unauthenticated) {
      yield AuthenticationStatus.unauthenticated;
    } else {
      yield AuthenticationStatus.loading;
    }
    yield* _authenticationStatusController.stream;
  }

  AuthenticationModelView() {
    getJwtFromLocalDB();
  }

  Future<void> getJwtFromLocalDB() async {
    await Future.delayed(const Duration(seconds: 2));
    token = "asdgmfevjknrek";
    if (token == null) {
      _authenticationStatusController.add(AuthenticationStatus.unauthenticated);
      _authenticationStatus = AuthenticationStatus.unauthenticated;
    } else {
      _authenticationStatusController.add(AuthenticationStatus.authenticated);
      _authenticationStatus = AuthenticationStatus.authenticated;
    }

    notifyListeners();
  }

  Future<void> logout() async {
    token = null;
    _authenticationStatusController.add(AuthenticationStatus.unauthenticated);
    _authenticationStatus = AuthenticationStatus.unauthenticated;
  }

  @override
  void dispose() {
    _authenticationStatusController.close();
    super.dispose();
    notifyListeners();
  }
}
