import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final completedBuildingSurvey = false.obs;
  final completedHealthSurvey = false.obs;
  final completedBothOnBoardingSurveys = false.obs;

  Color setEnvCardBackground() {
    return completedBothOnBoardingSurveys.value ? const Color.fromRGBO(50, 130, 184, 1) : const Color.fromRGBO(84, 92, 103, 1.0);
  }

  Color setCardBackground() {
    return completedBothOnBoardingSurveys.value ? const Color.fromRGBO(50, 130, 184, 1) : const Color.fromRGBO(84, 92, 103, 1.0);
  }

  Color setCardText() {
    return completedBothOnBoardingSurveys.value ? Colors.white : Colors.grey;
  }
}
