import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class CleaningService extends StatelessWidget {
  CleaningService({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Is a cleaning service contracted?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Form(
          child: Column(
            children: [
              ...buildingController.centerCleaningServices.map(
                (item) => Obx(() => RadioListTile(
                  title: Text(
                    item['text'],
                    style: const TextStyle(
                      color: Color.fromRGBO(187, 225, 250, 1.0),
                    ),
                  ),
                  value: item['value'],
                  groupValue: buildingController.centerCleaningService.value,
                  onChanged: (value) => {buildingController.centerCleaningService.value = value as int},
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
