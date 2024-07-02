import 'package:shared_preferences/shared_preferences.dart';

class UserAuthController {
  static String accestoken = '';
  static String _tokenKey = 'token';

 static Future<void> saveUserToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, token);
    accestoken = token;
  }

  static Future<String> getUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    accestoken = token ?? '';
    return accestoken;
  }

  static Future<bool> checkLogedInStatus() async {
    String token = await getUserToken();
    return token.isNotEmpty;
  }

  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accestoken = '';
  }
}
