import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ppkd_andra/login/preference_handler.dart';
import 'package:ppkd_andra/tugas%2015/models/editmodel.dart';
import 'package:ppkd_andra/tugas%2015/models/loginmodel.dart';
import 'package:ppkd_andra/tugas%2015/models/profilemodel.dart';
import 'package:ppkd_andra/tugas%2015/models/registermodel.dart';
import 'package:ppkd_andra/tugas%2015/constant/endpoint.dart';

class AuthAPI {
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<Profile> getProfile() async {
    final token = await PreferenceHandler.getToken();
    print(token);
    final url = Uri.parse(Endpoint.profile);
    final response = await http.get(
      url,
      headers: {"Accept": "application/json", 'Authorization': 'Bearer $token'},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<EditProfile> editUserProfile({
    required String name,
    required String email,
  }) async {
    final token = await PreferenceHandler.getToken();
    final url = Uri.parse(Endpoint.editprofile);

    final response = await http.put(
      url,
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
      body: {"name": name, "email": email},
    );

    print(response.body);

    if (response.statusCode == 200) {
      return EditProfile.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }
}
