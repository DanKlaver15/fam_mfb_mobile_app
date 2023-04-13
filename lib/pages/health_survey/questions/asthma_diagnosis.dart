import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/health_survey_controller.dart';

class AsthmaDiagnosis extends StatelessWidget {
  AsthmaDiagnosis({Key? key}) : super(key: key);

  final HealthcareSurveyController healthSurveyController = Get.find<HealthcareSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Does ${healthSurveyController.childName} have an Asthma diagnosis?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Obx(
          () => DropdownButton(
            dropdownColor: const Color.fromRGBO(15, 76, 117, 1),
            value: healthSurveyController.hasAsthmaDiagnosis.value,
            style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            underline: Container(
              height: 2,
              color: const Color.fromRGBO(15, 76, 117, 1),
            ),
            isExpanded: true,
            hint: const Text(
              'Asthma Diagnosis',
              style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
            ),
            items: healthSurveyController.hasAsthmaDiagnosisValues
                .map((item) => DropdownMenuItem(
                      value: item['value'],
                      child: Text(item['text'], style: const TextStyle(fontSize: 13)),
                    ))
                .toList(),
            onChanged: (value) {
              healthSurveyController.hasAsthmaDiagnosis.value = value as int;
            },
          ),
        ),
      ),
    );
  }
}
