import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'package:app/state/controllers/login_controller.dart';

class OnboardingPageController extends GetxController {
  OnboardingPageController({Key? key});

  var needsOnboarding = false.obs;
  var dotsCount = 5.obs;
  var page = 0.obs;
  var isSelected = false.obs;

  //user
  var userType = 1.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var dob = DateTime(1900, 1, 1).obs;
  var address1 = ''.obs;
  var address2 = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var zip = ''.obs;
  var phone = ''.obs;
  var center = ''.obs;

  final RegExp zipExpression = RegExp(r'(\d){5}');
  final TextEditingController textEditingController = TextEditingController();
  final LoginController loginController = Get.find();

  Future selectDate(context) async {
    DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
    if (picked != null) {
      dob.value = picked;
      textEditingController.text = DateFormat('MM/dd/yyyy').format(dob.value);
    }
  }

  Future<int?> markOnboardingComplete() async {
    print(phone.value);
    try {
      var db = await openDatabase('myFullBreath.db');
      var token = await db.query('USER', distinct: true, columns: ['TOKEN'], where: 'USER_ID = ?', whereArgs: [loginController.userId.value]);
      var response = await http.put(
        Uri.parse('http://app.famallies.org/api/users/${loginController.userId.value}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': '${token.first['TOKEN']}'
        },
        body: jsonEncode(<String, dynamic>{
          'isOnboardedFlag': true,
          'firstName': firstName.value,
          'lastName': lastName.value,
          'dob': dob.value.toString(),
          'phone': phone.value,
          'address': {
            'address1': address1.value,
            'address2': address2.value,
            'city': city.value,
            'state': state.value,
            'zip': zip.value,
          },
          'center': center.value,
        }),
      );
      return response.statusCode;
    } catch (e) {
      //print(e);
      return null;
    }
  }
}
