import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLocalDatasource {
  final futurePrefs = SharedPreferences.getInstance();

  Future<void> saveJwtToken(String jwtToken) async {
    SharedPreferences prefs = await futurePrefs;
    await prefs.setString("jwt", jwtToken);
  }

  Future<String?> getJwtToken() async {
    SharedPreferences prefs = await futurePrefs;
    return prefs.getString("jwt");
  }
}
