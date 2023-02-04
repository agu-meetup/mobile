import 'package:agu_meetup_mobile/data/sign_in/datasources/sign_in_server_datasource.dart';
import 'package:agu_meetup_mobile/data/sign_in/models/sign_in_request_model.dart';
import 'package:agu_meetup_mobile/domains/authentication/repository/authentication_repository.dart';

class SignInRepository {
  SignInServerDatasource signInServerDatasource = SignInServerDatasource();
  AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  Future<String> signInRepo(SignInRequestModel signInRequestModel) async {
    String token = await signInServerDatasource.signInDS(signInRequestModel);
    authenticationRepository.signIn(token);
    return token;
  }
}
