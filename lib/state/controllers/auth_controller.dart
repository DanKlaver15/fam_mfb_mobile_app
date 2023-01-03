import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/user.dart';

Future<User?> login(String email, String password) async {
  var response = await http.post(
    Uri.parse("http://app.famallies.org/api/auth/login"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
    }),
  );
  Map<String, dynamic> data = Map<String, dynamic>.from(json.decode(response.body));
  User user = User(
    userId: data['user']['_id'],
    email: data['user']['email'],
    userType: data['user']['userType'],
    isEmailVerifiedFlag: data['user']['isEmailVerifiedFlag'],
    isActiveResearchFlag: data['user']['isActiveResearchFlag'],
    isOnboardedFlag: data['user']['isOnboardedFlag'],
  );

  return user;
}

Future<int> logout(String userId) async {
  var response = await http.post(
    Uri.parse("http://app.famallies.org/api/auth/logout"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "userId": userId
    }),
  );
  return response.statusCode;
}