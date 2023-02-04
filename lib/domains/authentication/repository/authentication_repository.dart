import 'dart:async';

import 'package:agu_meetup_mobile/data/authentication/datasources/authentication_local_datasource.dart';

import '../../../core/enums.dart';

class AuthenticationRepository {
  static String? jwtToken;
  final AuthenticationLocalDatasource _authenticationLocalDatasource =
      AuthenticationLocalDatasource();

  Future<void> takeJwtTokenFromLocal() async {
    jwtToken = await _authenticationLocalDatasource.getJwtToken();
  }

  void signIn(String newToken) async {
    jwtToken = newToken;
    await _authenticationLocalDatasource.saveJwtToken(newToken);
  }

  Future<void> logOut() async {
    await _authenticationLocalDatasource.saveJwtToken("");
    jwtToken = "";
  }

  String? getJwtToken() {
    return jwtToken;
  }
}
