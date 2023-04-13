import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/health_survey_controller.dart';

class Eczema extends StatelessWidget {
  Eczema({Key? key}) : super(key: key);

  final HealthcareSurveyController healthSurveyController = Get.find<HealthcareSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Was ${healthSurveyController.childName}\'s diagnosed with eczema (atopic dermatitis) between birth and age 3 years?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Obx(
          () => DropdownButton(
            dropdownColor: const Color.fromRGBO(15, 76, 117, 1),
            value: healthSurveyController.hasEczema.value,
            style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            underline: Container(
              height: 2,
              color: const Color.fromRGBO(15, 76, 117, 1),
            ),
            isExpanded: true,
            hint: const Text(
              'Eczema Diagnosis',
              style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
            ),
            items: healthSurveyController.hasEczemaValues
                .map((item) => DropdownMenuItem(
                      value: item['value'],
                      child: Text(item['text'], style: const TextStyle(fontSize: 13)),
                    ))
                .toList(),
            onChanged: (value) {
              healthSurveyController.hasEczema.value = value as int;
            },
          ),
        ),
      ),
    );
  }
}
