import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';

Future<Tuple2<String?, int>> addUser(
    String email, String password, int userType) async {
  var response = await http.post(
    Uri.parse("http://app.famallies.org/api/users"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
      'userType': userType,
    }),
  );

  if (response.statusCode == 201) {
    Map<String, dynamic> data =
        Map<String, dynamic>.from(json.decode(response.body));
    String? userId = data['user']['_id'];
    return Tuple2(userId, response.statusCode);
  } else {
    return Tuple2(null, response.statusCode);
  }
}

Future<int> sendEmailVerification(String email) async {
  var response = await http.post(
    Uri.parse("http://app.famallies.org/api/verifyEmail"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{'email': email}),
  );

  return response.statusCode;
}
