import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class BuildingType extends StatelessWidget {
  BuildingType({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Type of Building?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
        child: Obx(
          () => DropdownButton(
            dropdownColor: const Color.fromRGBO(15, 76, 117, 1),
            value: buildingController.buildingType.value,
            style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            underline: Container(
              height: 2,
              color: const Color.fromRGBO(50, 130, 184, 1),
            ),
            isExpanded: true,
            hint: const Text(
              'Building Type',
              style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
            ),
            items: buildingController.buildingTypes
                .map((item) => DropdownMenuItem(
                      value: item['value'],
                      child: Text(item['text'], style: const TextStyle(fontSize: 13)),
                    ))
                .toList(),
            onChanged: (value) {
              buildingController.buildingType.value = value as int;
            },
          ),
        ),
      ),
    );
  }
}
