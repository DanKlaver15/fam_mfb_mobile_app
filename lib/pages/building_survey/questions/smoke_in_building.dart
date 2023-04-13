import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class SmokeInBuilding extends StatelessWidget {
  SmokeInBuilding({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Does anyone ever smoke in the building, including non-business hours or rooms?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Obx(
          () => Column(
            children: [
              RadioListTile(
                title: const Text('True'),
                value: true,
                groupValue: buildingController.smokeInBuilding.value,
                onChanged: (value) {
                  buildingController.smokeInBuilding.value = value!;
                },
              ),
              RadioListTile(
                title: const Text('False'),
                value: false,
                groupValue: buildingController.smokeInBuilding.value,
                onChanged: (value) {
                  buildingController.smokeInBuilding.value = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
