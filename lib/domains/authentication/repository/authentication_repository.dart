import 'dart:async';

import 'package:agu_meetup_mobile/core/my_service.dart';
import 'package:agu_meetup_mobile/data/authentication/datasources/authentication_local_datasource.dart';
import 'package:agu_meetup_mobile/data/authentication/models/sign_in_request_model.dart';
import 'package:agu_meetup_mobile/domains/user/repository/user_repository.dart';

import '../../../data/authentication/datasources/authentication_server_datasource.dart';
import '../../../data/authentication/models/sign_up_request_model.dart';

class AuthenticationRepository {
  /// Data Layers
  final AuthenticationLocalDatasource _authenticationLocalDatasource =
      AuthenticationLocalDatasource();
  final AuthenticationServerDatasource _authenticationServerDatasource =
  AuthenticationServerDatasource();

  /// Domain Layer
  final UserRepository userRepository = UserRepository();

  /// Attributes
  static String? jwtToken;

  Future<void> takeJwtTokenFromLocal() async {
    jwtToken = await _authenticationLocalDatasource.getJwtToken();
    MyService().updateJwtToken(jwtToken);
    await userRepository.updateUserInfo();
  }

  Future<void> signIn(SignInRequestModel signInRequestModel) async {
    String newToken = await _authenticationServerDatasource.signInDS(signInRequestModel);
    jwtToken = newToken;
    MyService().updateJwtToken(jwtToken);
    await userRepository.updateUserInfo();
    await _authenticationLocalDatasource.saveJwtToken(newToken);
  }

  Future<void> signUp(SignUpRequestModel signUpRequestModel) async {
    await _authenticationServerDatasource.signUpDS(signUpRequestModel);
  }

  Future<void> logOut() async {
    await _authenticationLocalDatasource.saveJwtToken("");
    jwtToken = "";
    MyService().updateJwtToken(jwtToken);
    await userRepository.updateUserInfo();
  }

  String? getJwtToken() {
    return jwtToken;
  }
}
