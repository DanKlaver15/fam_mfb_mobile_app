import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class OtherAccreditation extends StatelessWidget {
  OtherAccreditation({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Other Accreditation?',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
            child: Obx(
              () => DropdownButton(
                dropdownColor: const Color.fromRGBO(15, 76, 117, 1),
                value: buildingController.otherAccreditationType.value,
                style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                underline: Container(
                  height: 2,
                  color: const Color.fromRGBO(50, 130, 184, 1),
                ),
                isExpanded: true,
                hint: const Text(
                  'Accreditation Type',
                  style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
                ),
                items: buildingController.otherAccreditationTypes
                    .map((item) => DropdownMenuItem(
                          value: item['value'],
                          child: Text(item['text'], style: const TextStyle(fontSize: 13)),
                        ))
                    .toList(),
                onChanged: (value) {
                  buildingController.otherAccreditationType.value = value as int;
                },
              ),
            ),
          ),
          (buildingController.otherAccreditationType.value == 3)
          ? Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
            child: TextField(
              style: const TextStyle(
                color: Color.fromRGBO(187, 225, 250, 1.0),
                fontSize: 12,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(15, 76, 117, 1.0), width: 2.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(50, 130, 184, 1.0), width: 2.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                filled: true,
                fillColor: Color.fromRGBO(27, 38, 44, 1.0),
                hintText: 'Please enter the other accreditation here',
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 13,
                ),
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
              ),
              autocorrect: false,
              onChanged: (value) {
                buildingController.otherAccreditationTypeOther.value = value;
              },
            ),
          )
          : const SizedBox(),
        ],
      ),
    );
  }
}
