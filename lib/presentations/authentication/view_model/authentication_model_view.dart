import 'dart:async';

import 'package:agu_meetup_mobile/core/enums.dart';
import 'package:agu_meetup_mobile/domains/authentication/repository/authentication_repository.dart';

import 'package:flutter/material.dart';

class AuthenticationModelView extends ChangeNotifier {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();
  final _authenticationStatusController =
      StreamController<AuthenticationStatus>.broadcast();
  AuthenticationStatus _authenticationStatus = AuthenticationStatus.loading;

  AuthenticationModelView() {
    getJwtFromLocalDB();
    // logout();
  }

  Stream<AuthenticationStatus> get authStatus async* {
    yield _authenticationStatus;
    yield* _authenticationStatusController.stream;
  }

  Future<void> getJwtFromLocalDB() async {
    await _authenticationRepository.takeJwtTokenFromLocal();
    updateAuthStatus();
  }

  Future<void> logout() async {
    await _authenticationRepository.logOut();
    updateAuthStatus();
  }

  void updateAuthStatus() {
    String? token = _authenticationRepository.getJwtToken();
    if (token == null || token == "") {
      _authenticationStatusController.add(AuthenticationStatus.unauthenticated);
      _authenticationStatus = AuthenticationStatus.unauthenticated;
    } else {
      _authenticationStatusController.add(AuthenticationStatus.authenticated);
      _authenticationStatus = AuthenticationStatus.authenticated;
    }
  }
}
