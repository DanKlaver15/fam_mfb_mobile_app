import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> getSecret(String email, String password) async {
  var response = await http.post(
    Uri.parse("http://app.famallies.org/api/analytics"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
    }),
  );
  Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}