import 'package:agu_meetup_mobile/data/sign_up/datasources/sign_up_server_datasource.dart';
import 'package:agu_meetup_mobile/data/sign_up/models/sign_up_request_model.dart';

class SignUpRepository {
  SignUpServerDatasource signUpServerDatasource = SignUpServerDatasource();

  Future<void> signUpRepo(SignUpRequestModel signUpRequestModel) async {
    await signUpServerDatasource.signUpDS(signUpRequestModel);
  }
}
