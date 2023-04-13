import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PasswordResetController extends GetxController {
  Future<int> forgotPassword(String email) async {
    var response = await http.post(
      Uri.parse('http://app.famallies.org/api/resetPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
      }),
    );
    return response.statusCode;
  }
}
