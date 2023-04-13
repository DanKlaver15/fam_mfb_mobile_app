import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class HeadStart extends StatelessWidget {
  HeadStart({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Head Start?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Obx(
          () => Column(
            children: [
              RadioListTile(
                title: const Text(
                  'True',
                  style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0)),
                ),
                activeColor: const Color.fromRGBO(187, 225, 250, 1.0),
                value: true,
                groupValue: buildingController.headStart.value,
                onChanged: (value) {
                  buildingController.headStart.value = value!;
                },
              ),
              RadioListTile(
                title: const Text(
                  'False',
                  style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0)),
                ),
                value: false,
                groupValue: buildingController.headStart.value,
                onChanged: (value) {
                  buildingController.headStart.value = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
