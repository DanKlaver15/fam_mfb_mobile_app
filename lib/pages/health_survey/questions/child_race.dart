import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/health_survey_controller.dart';

class ChildRace extends StatelessWidget {
  ChildRace({Key? key}) : super(key: key);

  final HealthcareSurveyController healthSurveyController = Get.find<HealthcareSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Race of ${healthSurveyController.childName}',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Obx(
          () => Column(
            children: [
              DropdownButton(
                dropdownColor: const Color.fromRGBO(15, 76, 117, 1),
                value: healthSurveyController.childRace.value,
                style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                underline: Container(
                  height: 2,
                  color: const Color.fromRGBO(15, 76, 117, 1),
                ),
                isExpanded: true,
                hint: const Text(
                  'Please choose an option',
                  style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
                ),
                items: healthSurveyController.childRaceValues
                    .map((item) => DropdownMenuItem(
                  value: item['value'],
                  child: Text(item['text'], style: const TextStyle(fontSize: 13)),
                ))
                    .toList(),
                onChanged: (value) {
                  healthSurveyController.childRace.value = value as int;
                },
              ),
              (healthSurveyController.childRace.value == 12)
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
                    hintText: 'Please enter the race here',
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                  ),
                  autocorrect: false,
                  onChanged: (value) {
                    healthSurveyController.childRaceOther.value = value;
                  },
                ),
              )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
