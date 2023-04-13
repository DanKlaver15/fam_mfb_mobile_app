import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class MoldInBuilding extends StatelessWidget {
  MoldInBuilding({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

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
                groupValue: buildingController.moldInBuilding.value,
                onChanged: (value) {
                  buildingController.moldInBuilding.value = value!;
                },
              ),
              RadioListTile(
                title: const Text('False'),
                value: false,
                groupValue: buildingController.moldInBuilding.value,
                onChanged: (value) {
                  buildingController.moldInBuilding.value = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
