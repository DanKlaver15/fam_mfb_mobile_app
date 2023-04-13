import 'dart:convert';

import 'package:app/state/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BuildingSurveyController extends GetxController {
  final DashboardController dashboardController = Get.find();

  var dotsCount = 15.obs;
  var page = 0.obs;
  var isSelected = false.obs;
  var allQuestionsCompleted = false.obs;
  var clickedOnButton = false.obs;

  Future selectOpenTime(context, controller, openingTimeVariable) async {
    TimeOfDay? picked = await showTimePicker(context: context, initialTime: const TimeOfDay(hour: 9, minute: 0));
    if (picked != null) {
      openingTimeVariable.value = picked;
      controller.text = (openingTimeVariable.value as TimeOfDay).format(context);
    }
  }

  Future selectCloseTime(context, controller, closingTimeVariable) async {
    TimeOfDay? picked = await showTimePicker(context: context, initialTime: const TimeOfDay(hour: 17, minute: 0));
    if (picked != null) {
      closingTimeVariable.value = picked;
      controller.text = (closingTimeVariable.value as TimeOfDay).format(context);
    }
  }

  /// Question 1
  ///
  ///Type of Building
  final buildingType = Rxn<int>();
  final List<Map> buildingTypes = [
    {'value': 1, 'text': 'Single family stand-alone home'},
    {'value': 2, 'text': 'Duplex'},
    {'value': 3, 'text': 'Multi-family'},
    {'value': 4, 'text': 'Single business commercial building'},
    {'value': 5, 'text': 'Multi-business commercial building'},
  ];

  /// Question 2
  ///
  /// Type of Childcare
  final childcareType = Rxn<int>();
  final List<Map> childcareTypes = [
    {'value': 1, 'text': 'Single family stand-alone home'},
    {'value': 2, 'text': 'Duplex'},
    {'value': 3, 'text': 'Multi-family'},
    {'value': 4, 'text': 'Single business commercial building'},
    {'value': 5, 'text': 'Multi-business commercial building'},
  ];

  /// Question 3
  ///
  /// Head Start?
  final headStart = Rxn<bool>();

  /// Question 4
  ///
  /// Other Accreditation?
  final otherAccreditationType = Rxn<int>();
  final otherAccreditationTypeOther = Rxn<String>();
  final List<Map> otherAccreditationTypes = [
    {'value': 1, 'text': 'NAC'},
    {'value': 2, 'text': 'NAYCE'},
    {'value': 3, 'text': 'Other'},
    {'value': 4, 'text': 'None'},
  ];

  /// Question 5 (multi-select)
  ///
  /// In addition to state licensing requirements,
  /// has your childcare center created policies or rules in any of the following areas related to asthma and/or indoor air quality?
  final centerAsthmaPolicy = [].obs;
  final List<Map> centerAsthmaPolicies = [
    {'value': false, 'text': 'Cleaning'},
    {'value': false, 'text': 'Smoking or secondhand smoke'},
    {'value': false, 'text': 'Building or classroom structure'},
    {'value': false, 'text': 'Health'},
    {'value': false, 'text': 'Staff education'},
    {'value': false, 'text': 'I don\'t know'},
  ].obs;

  /// Question 6
  ///
  /// Total Allowable enrollment
  final totalAllowableEnrollment = Rxn<int>();
  final totalAllowableEnrollmentUnderFive = Rxn<int>();

  /// Question 7
  ///
  /// Hours of Operation (Times that children are in the building)
  final weekdayHoursOpen = Rxn<TimeOfDay>();
  final weekdayHoursClose = Rxn<TimeOfDay>();

  final saturdayHoursOpen = Rxn<TimeOfDay>();
  final saturdayHoursClose = Rxn<TimeOfDay>();

  final sundayHoursOpen = Rxn<TimeOfDay>();
  final sundayHoursClose = Rxn<TimeOfDay>();
  // final List<Map> childcareHoursWeekday = [
  //   {'value': 1, 'text': 'Open'},
  //   {'value': 2, 'text': 'Close'},
  // ];
  // final List<Map> childcareHoursSaturday = [
  //   {'value': 1, 'text': 'Open'},
  //   {'value': 2, 'text': 'Close'},
  // ];
  // final List<Map> childcareHoursSunday = [
  //   {'value': 1, 'text': 'Open'},
  //   {'value': 2, 'text': 'Close'},
  // ];

  /// Question 8
  ///
  /// Is a cleaning service contracted?
  final centerCleaningService = Rxn<int>();
  final List<Map> centerCleaningServices = [
    {'value': 1, 'text': 'Daily'},
    {'value': 2, 'text': 'Weekly'},
    {'value': 3, 'text': 'Monthly'},
    {'value': 4, 'text': 'No'},
  ];

  /// Question 9
  ///
  /// Who is mainly responsible for maintaining the furnace, air conditioning system including changing furnace filters?
  final hvacMaintenanceType = Rxn<int>();
  final List<Map> hvacMaintenanceTypes = [
    {'value': 1, 'text': 'I or someone in my family'},
    {'value': 2, 'text': 'Landlord contracts with a company'},
    {'value': 3, 'text': 'Daycare employee'},
    {'value': 4, 'text': 'Building management contracts with a company'},
    {'value': 5, 'text': 'I do not know'},
  ];

  /// Question 10
  ///
  /// Does anyone ever smoke in the building, including non-business hours or rooms?
  final smokeInBuilding = Rxn<bool>();

  /// Question 11
  ///
  /// How often do you smell tobacco smoke in your building (from guests, clients, visitors)
  final smellTobaccoFreq = Rxn<int>();

  /// Question 12
  ///
  /// Does a furry or feathered pet currently live in the building?
  final petInBuilding = Rxn<bool>();

  /// Question 13 (multi-select)
  ///
  /// Select all the ways cooking is done in your building
  final cookingType = [].obs;
  final cookingTypeOther = Rxn<String>();
  final List<Map> cookingTypes = [
    {'value': false, 'text': 'Gas stove'}.obs,
    {'value': false, 'text': 'Electric stove'}.obs,
    {'value': false, 'text': 'Microwave'}.obs,
    {'value': false, 'text': 'Warming boxes'}.obs,
    {'value': false, 'text': 'Other'}.obs,
    {'value': false, 'text': 'None'}.obs,
  ];

  /// Question 14
  ///
  /// Has a pest company applied any controls in the last 12 months?
  final recentPestControlType = [].obs;
  final recentPestControlTypeOther = Rxn<String>();
  final List<Map> recentPestControlTypes = [
    {'value': false, 'text': 'Yes (roaches)'}.obs,
    {'value': false, 'text': 'Yes (rodents)'}.obs,
    {'value': false, 'text': 'Yes (other)'}.obs,
    {'value': false, 'text': 'No'}.obs,
  ];

  /// Question 15
  ///
  /// Can you see or smell mold anywhere in the building?
  final moldInBuilding = Rxn<bool>();

  Future<int> submitResponses(String userId) async {
    if (buildingType.value != null &&
        childcareType.value != null &&
        headStart.value != null &&
        otherAccreditationType.value != null &&
        totalAllowableEnrollment.value != null &&
        totalAllowableEnrollmentUnderFive.value != null &&
        weekdayHoursOpen.value != null &&
        weekdayHoursClose.value != null &&
        saturdayHoursOpen.value != null &&
        saturdayHoursClose.value != null &&
        sundayHoursOpen.value != null &&
        sundayHoursClose.value != null &&
        centerCleaningService.value != null &&
        hvacMaintenanceType.value != null &&
        smokeInBuilding.value != null &&
        smellTobaccoFreq.value != null &&
        petInBuilding.value != null &&
        moldInBuilding.value != null) {
      allQuestionsCompleted.value == true;

      var response = await http.post(
        Uri.parse('http://app.famallies.org/api/onboarding/building_survey'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userId': userId,
          'buildingType': buildingType.value!,
          'childcareType': childcareType.value!,
          'headStart': headStart,
          'otherAccreditationType': otherAccreditationType.value!,
          'otherAccreditationTypeOther': otherAccreditationTypeOther.value!,
          'centerAsthmaPolicy': centerAsthmaPolicies,
          'totalAllowableEnrollment': totalAllowableEnrollment.value!,
          'totalAllowableEnrollmentUnderFive': totalAllowableEnrollmentUnderFive.value!,
          'weekdayHoursOpen': weekdayHoursOpen,
          'weekdayHoursClose': weekdayHoursClose,
          'saturdayHoursOpen': saturdayHoursOpen,
          'saturdayHoursClose': saturdayHoursClose,
          'sundayHoursOpen': sundayHoursOpen,
          'sundayHoursClose': sundayHoursClose,
          'centerCleaningService': centerCleaningService,
          'hvacMaintenanceType': hvacMaintenanceType,
          'smokeInBuilding': smokeInBuilding,
          'smellTobaccoFreq': smellTobaccoFreq,
          'petInBuilding': petInBuilding,
          'cookingType': cookingType,
          'cookingTypeOther': cookingTypeOther,
          'recentPestControlType': recentPestControlType,
          'moldInBuilding': moldInBuilding
        }),
      );
      if (response.statusCode == 200) {
        dashboardController.completedBuildingSurvey.value = true;
      }
      return response.statusCode;
    }
    else {
      return -1;
    }
  }
}
