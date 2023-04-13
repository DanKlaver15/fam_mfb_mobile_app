import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:hive_flutter/hive_flutter.dart';

import 'package:app/state/controllers/hive_controller.dart';

class IaqPageController extends GetxController {
  var needsOnboarding = false.obs;
  var showSwipeAnimation = false.obs;
  var dotsCount = 4.obs;
  var page = 0.obs;
  var isSelected = false.obs;
  var heatType = 0.obs;
  var openWindowType = 0.obs;
  var plasticOnWindowsType = 0.obs;

  final List<Map> buildingHeatTypes = [
    {'value': 1, 'text': 'Baseboard'},
    {'value': 2, 'text': 'Fireplace'},
    {'value': 3, 'text': 'Forced Air (vents)'},
    {'value': 4, 'text': 'Radiator'},
    {'value': 5, 'text': 'Space Heater'},
    {'value': 6, 'text': 'Other'},
    {'value': 7, 'text': 'I don\'t know'},
  ];

  final List<Map> openWindowTypes = [
    {'value': 1, 'text': 'Yes, we open regularly, even in winter'},
    {'value': 2, 'text': 'Yes, we open when the weather is nice'},
    {'value': 3, 'text': 'Yes, but we never open them'},
    {'value': 4, 'text': 'No'},
  ];

  final List<Map> plasticOnWindowsTypes = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
  ];



  void setSwipeAnimation() {
    Timer? timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      showSwipeAnimation.value = false;
    });
    showSwipeAnimation.value = true;
    if(showSwipeAnimation.value == false) {
      timer.cancel();
    }
  }
}


// var box = await Hive.openBox('myFullBreath');
// if (await box.get('firstTimeOpening').item2 == true) {
// Timer? timer = Timer.periodic(const Duration(milliseconds: 2400), (timer) {
// showSwipeAnimation.value = false;
// });
// showSwipeAnimation.value = true;
// if (showSwipeAnimation.value == false) {
// timer.cancel();
// }
// }
