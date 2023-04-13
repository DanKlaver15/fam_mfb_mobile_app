import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

import '../../models/user.dart';

Future<Tuple2<User?, String?>> login(String email, String password) async {
  try {
    var response = await http.post(
      Uri.parse('http://app.famallies.org/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      Map<String, dynamic> responseData = Map<String, dynamic>.from(json.decode(response.body));

      User user = User(
        userId: responseData['user']['_id'],
        email: responseData['user']['email'],
        userType: responseData['user']['userType'],
        isEmailVerifiedFlag: responseData['user']['isEmailVerifiedFlag'],
        isActiveResearchFlag: responseData['user']['isActiveResearchFlag'],
        isOnboardedFlag: responseData['user']['isOnboardedFlag'],
      );
      String token = responseData['token'];

      return Tuple2(user, token);
    } else {
      return const Tuple2(null, null);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    throw('Sorry, this is broken');
  }
}

Future<int> logout(String userId) async {
  var response = await http.post(
    Uri.parse('http://app.famallies.org/api/auth/logout'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId
    }),
  );
  return response.statusCode;
}
