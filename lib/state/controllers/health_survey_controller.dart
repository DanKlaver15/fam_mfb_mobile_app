import 'dart:convert';

import 'package:app/state/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HealthcareSurveyController extends GetxController {
  var dotsCount = 23.obs;
  var page = 0.obs;
  var isSelected = false.obs;
  var allQuestionsCompleted = true.obs;
  final TextEditingController textEditingController = TextEditingController();
  final DashboardController dashboardController = Get.find();

  /// Question 1
  ///
  ///What is your child's name? (If you have more than one child, choose which will participate)
  final childName = ''.obs;

  /// Question 2
  ///
  /// {childName}'s Date of Birth
  final dob = DateTime(1990, 1, 1).obs;

  /// Question 3
  ///
  /// Does {childName} have an Asthma diagnosis?
  final hasAsthmaDiagnosis = Rxn<int>();
  final List<Map> hasAsthmaDiagnosisValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 4
  ///
  /// Has {childName}'s biological father ever been diagnosed or treated for asthma?
  final hasFatherAsthma = Rxn<int>();
  final List<Map> hasFatherAsthmaValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 5
  ///
  /// Has {childName}'s biological mother ever been diagnosed or treated for asthma?
  final hasMotherAsthma = Rxn<int>();
  final List<Map> hasMotherAsthmaValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 6
  ///
  /// Was {childName} diagnosed with eczema (atopic dermatitis) between birth and age 3 years?
  final hasEczema = Rxn<int>();
  final List<Map> hasEczemaValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 7
  ///
  /// From birth to age 3 years, did {childName} ever wheeze?
  final hasWheeze = Rxn<int>();
  final List<Map> hasWheezeValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 8
  ///
  /// Did {{child_name}} ever wheeze when not sick?
  final hasWheezeWhenNotSick = Rxn<int>();
  final List<Map> hasWheezeWhenNotSickValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 9 (multi-select)
  ///
  /// Has {{child_name}} ever tested positive on an allergy test?
  final hasAllergyTest = Rxn<int>();
  final List<Map> hasAllergyTestValues = [
    {'value': 1, 'text': 'Yes (dust mites)'},
    {'value': 2, 'text': 'Yes (cockroaches)'},
    {'value': 3, 'text': 'Yes (mold)'},
    {'value': 4, 'text': 'Yes (spring pollen)'},
    {'value': 5, 'text': 'Yes (summer pollen)'},
    {'value': 6, 'text': 'Yes (fall pollen)'},
    {'value': 7, 'text': 'Yes (rodents)'},
    {'value': 8, 'text': 'Yes (pets - dog/cat)'},
    {'value': 9, 'text': 'I don\t know'},
    {'value': 10, 'text': 'Has never been tested'},
  ];

  /// Question 10
  ///
  /// Did {{child_name}}'s biological mother have? (environmental allergies, food allergies, Eczema/atopic dermatitis)
  final historyMotherEnvAllergies = Rxn<int>();
  final List<Map> historyMotherEnvAllergiesValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  final historyMotherFoodAllergies = Rxn<int>();
  final List<Map> historyMotherFoodAllergiesValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  final historyMotherEczemaDerm = Rxn<int>();
  final List<Map> historyMotherEczemaDermValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 11
  ///
  /// Did {{child_name}}'s biological father have? (environmental allergies, food allergies, Eczema/atopic dermatitis)
  final historyFatherEnvAllergies = Rxn<int>();
  final List<Map> historyFatherEnvAllergiesValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  final historyFatherFoodAllergies = Rxn<int>();
  final List<Map> historyFatherFoodAllergiesValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  final historyFatherEczemaDerm = Rxn<int>();
  final List<Map> historyFatherEczemaDermValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 12
  ///
  /// Has {{child_name}} ever been sick with? (Croup, Bronchiolitis, COVID-19)
  final historyChildCroup = Rxn<int>();
  final List<Map> historyChildCroupValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  final historyChildBronchiolitis = Rxn<int>();
  final List<Map> historyChildBronchiolitisValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  final historyChildCovid = Rxn<int>();
  final List<Map> historyChildCovidValues = [
    {'value': 1, 'text': 'Yes'},
    {'value': 2, 'text': 'No'},
    {'value': 3, 'text': 'I don\t know'},
  ];

  /// Question 13
  ///
  /// Can you see or smell mold anywhere in the building?
  var healthMold = false.obs;

  /// Question 14
  ///
  /// Race of {{child_name}}
  final childRace = Rxn<int>();
  final childRaceOther = ''.obs;
  final List<Map> childRaceValues = [
    {'value': 1, 'text': 'Not of Hispanic/Latino origin'},
    {'value': 2, 'text': 'Mexican'},
    {'value': 3, 'text': 'Mexican American'},
    {'value': 4, 'text': 'Puerto Rico'},
    {'value': 5, 'text': 'Cuban'},
    {'value': 6, 'text': 'Another Hispanic/Latino origin'},
    {'value': 7, 'text': 'White'},
    {'value': 8, 'text': 'Black or African American'},
    {'value': 9, 'text': 'American Indian or Alaska Native'},
    {'value': 10, 'text': 'Asian'},
    {'value': 11, 'text': 'Native Hawaiian or Other Pacific Islander'},
    {'value': 12, 'text': 'Other'},
    {'value': 13, 'text': 'Decline to answer'},
  ];

  /// Question 15
  ///
  /// What is {{child_name}}'s biological mother's racial background?
  final motherRace = Rxn<int>();
  final motherRaceOther = ''.obs;
  final List<Map> motherRaceValues = [
    {'value': 1, 'text': 'Not of Hispanic/Latino origin'},
    {'value': 2, 'text': 'Mexican'},
    {'value': 3, 'text': 'Mexican American'},
    {'value': 4, 'text': 'Puerto Rico'},
    {'value': 5, 'text': 'Cuban'},
    {'value': 6, 'text': 'Another Hispanic/Latino origin'},
    {'value': 7, 'text': 'White'},
    {'value': 8, 'text': 'Black or African American'},
    {'value': 9, 'text': 'American Indian or Alaska Native'},
    {'value': 10, 'text': 'Asian'},
    {'value': 11, 'text': 'Native Hawaiian or Other Pacific Islander'},
    {'value': 12, 'text': 'Other'},
    {'value': 13, 'text': 'Decline to answer'},
  ];

  /// Question 16
  ///
  /// What is {{child_name}}'s biological father's racial background?
  final fatherRace = Rxn<int>();
  final fatherRaceOther = ''.obs;
  final List<Map> fatherRaceValues = [
    {'value': 1, 'text': 'Not of Hispanic/Latino origin'},
    {'value': 2, 'text': 'Mexican'},
    {'value': 3, 'text': 'Mexican American'},
    {'value': 4, 'text': 'Puerto Rico'},
    {'value': 5, 'text': 'Cuban'},
    {'value': 6, 'text': 'Another Hispanic/Latino origin'},
    {'value': 7, 'text': 'White'},
    {'value': 8, 'text': 'Black or African American'},
    {'value': 9, 'text': 'American Indian or Alaska Native'},
    {'value': 10, 'text': 'Asian'},
    {'value': 11, 'text': 'Native Hawaiian or Other Pacific Islander'},
    {'value': 12, 'text': 'Other'},
    {'value': 13, 'text': 'Decline to answer'},
  ];

  Future selectDate(context) async {
    DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
    if (picked != null) {
      dob.value = picked;
      textEditingController.text = DateFormat('MM/dd/yyyy').format(dob.value);
    }
  }

  Future<int> submitResponses(String userId) async {
    if (childName.value.isNotEmpty &&
        dob.value.year > 1900 &&
        hasAsthmaDiagnosis.value != null &&
        hasFatherAsthma.value != null &&
        hasMotherAsthma.value != null &&
        hasEczema.value != null &&
        hasWheeze.value != null &&
        hasWheezeWhenNotSick.value != null &&
        hasAllergyTest.value != null &&
        historyMotherEnvAllergies.value != null &&
        historyMotherFoodAllergies.value != null &&
        historyMotherEczemaDerm.value != null &&
        historyFatherEnvAllergies.value != null &&
        historyFatherFoodAllergies.value != null &&
        historyFatherEczemaDerm.value != null &&
        historyChildCroup.value != null &&
        historyChildBronchiolitis.value != null &&
        historyChildCovid.value != null &&
        childRace.value != null &&
        motherRace.value != null &&
        fatherRace.value != null
    ) {
      allQuestionsCompleted.value == true;

      var response = await http.post(
        Uri.parse('http://app.famallies.org/api/onboarding/health_survey'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userId': userId,
          'childName': childName,
          'dob': dob,
          'hasAsthmaDiagnosis': hasAsthmaDiagnosis,
          'hasFatherAsthma': hasFatherAsthma,
          'hasMotherAsthma': hasMotherAsthma,
          'hasEczema': hasEczema,
          'hasWheeze': hasWheeze,
          'hasWheezeWhenNotSick': hasWheezeWhenNotSick,
          'hasAllergyTest': hasAllergyTest,
          'historyMotherEnvAllergies': historyMotherEnvAllergies,
          'historyMotherFoodAllergies': historyMotherFoodAllergies,
          'historyMotherEczemaDerm': historyMotherEczemaDerm,
          'historyFatherEnvAllergies': historyFatherEnvAllergies,
          'historyFatherFoodAllergies': historyFatherFoodAllergies,
          'historyFatherEczemaDerm': historyFatherEczemaDerm,
          'historyChildCroup': historyChildCroup,
          'historyChildBronchiolitis': historyChildBronchiolitis,
          'historyChildCovid': historyChildCovid,
          'healthMold': healthMold,
          'childRace': childRace,
          'childRaceOther': childRaceOther,
          'motherRace': motherRace,
          'motherRaceOther': motherRaceOther,
          'fatherRace': fatherRace,
          'fatherRaceOther': fatherRaceOther
        }),
      );
      if (response.statusCode == 200) {
        dashboardController.completedBuildingSurvey.value = true;
      }
      return response.statusCode;
    }
    else {
      allQuestionsCompleted.value = false;
      return -1;
    }
  }
}
