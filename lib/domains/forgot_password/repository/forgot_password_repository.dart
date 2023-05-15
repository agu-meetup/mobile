import 'package:agu_meetup_mobile/data/forgot_password/datasources/forgot_password_server_datasource.dart';

class ForgotPasswordRepository {
  /// Data Layers
  ForgotPasswordServerDatasource forgotPasswordServerDS = ForgotPasswordServerDatasource();
  static int? userId;

  Future<void> codeSender({required String email}) async {
    int tempUserId = await forgotPasswordServerDS.codeSender(email: email);
    userId = tempUserId;
  }

  Future<void> verifyCode({required int recoveryCode}) async {
    await forgotPasswordServerDS.verifyCode(userId: userId!, recoveryCode: recoveryCode);
  }

  Future<void> resetPassword({required String newPassword}) async {
    await forgotPasswordServerDS.resetPassword(userId: userId!, newPassword: newPassword);
  }

}