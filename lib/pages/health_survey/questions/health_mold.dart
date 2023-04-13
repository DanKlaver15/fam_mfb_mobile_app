import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/health_survey_controller.dart';

class HealthMold extends StatelessWidget {
  HealthMold({Key? key}) : super(key: key);

  final HealthcareSurveyController healthSurveyController = Get.find<HealthcareSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Can you see or smell mold anywhere in the building?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Obx(
          () => Column(
            children: [
              RadioListTile(
                title: const Text('True'),
                value: true,
                groupValue: healthSurveyController.healthMold.value,
                onChanged: (value) {
                  healthSurveyController.healthMold.value = value!;
                },
              ),
              RadioListTile(
                title: const Text('False'),
                value: false,
                groupValue: healthSurveyController.healthMold.value,
                onChanged: (value) {
                  healthSurveyController.healthMold.value = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
