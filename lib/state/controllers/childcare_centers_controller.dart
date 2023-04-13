import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChildcareCenterController extends GetxController {
  List<Map> centerList = [];
  final Rxn<int> center = Rxn<int>();

  Future<void> getCenters() async {
    try {
      var response = await http.get(
        Uri.parse('http://app.famallies.org/api/centers'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<Map> tempCenterList = [];
      Map<String, dynamic> responseData = Map<String, dynamic>.from(json.decode(response.body));
      int i = 0;
      for (var element in responseData['centers']) {
        element.forEach((k, v) => k == 'name' ? tempCenterList.add({'value': i, 'text': v}) : null);
        i++;
      }
      centerList = tempCenterList;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw ('Sorry, this is broken');
    }
  }
}
