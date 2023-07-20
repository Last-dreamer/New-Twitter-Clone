// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/data/model/twitter.dart';

class Pref {
  Pref();

  static Future<bool> saveUser(User user) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();

    if (_preferences.containsKey("user")) {
      _preferences.clear();
    }
    final userJson = jsonEncode(user.toJson());
    return _preferences.setString("user", userJson);
  }

  static Future<User?> getUser() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    String? userJson = _preferences.getString("user");
    if (userJson != null) {
      var userMap = jsonDecode(userJson);
      var user = User.fromJson(userMap);
      return user;
    }
    return null;
  }
}
