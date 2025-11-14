import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String isLogin = "isLogin";
  static const String isToken = "isToken";
  static const String usernameKey = "username";
  static const String emailKey = "email";

  static saveLogin(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, value);
  }

  static saveToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(isToken, value);
  }

  static saveUsername(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(usernameKey, value);
  }

  static saveEmail(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(emailKey, value);
  }

  static getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin);
  }

  static getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(isToken);
  }

  static getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }

  static getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey);
  }

  static removeLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(isLogin);
    prefs.remove(isToken);
    prefs.remove(usernameKey);
    prefs.remove(emailKey);
  }
}
