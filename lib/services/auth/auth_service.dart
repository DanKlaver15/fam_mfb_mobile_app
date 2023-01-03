import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/user.dart';

Future<int> login(String email, String password) async {
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
  return response.statusCode;
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