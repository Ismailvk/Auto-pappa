import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._();
  static final _instance = SharedPref._();
  static SharedPref get instance => _instance;

  static const String token = 'token';
  late SharedPreferences sharedPref;

  initStorage() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  storeToken(hostToken) async {
    await sharedPref.setString(token, hostToken);
  }

  removeToken() async {
    await sharedPref.remove(token);
  }

  String? getToke() {
    return sharedPref.getString(token);
  }
}
