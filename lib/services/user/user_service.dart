import 'dart:convert';

import 'package:http/http.dart' as http;

Future<int> addUser(String email, String password, int userType) async {

  var response = await http.post(
    Uri.parse('http://app.famallies.org/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
      'userType': userType,
    }),
  );

  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

  return response.statusCode;
}
