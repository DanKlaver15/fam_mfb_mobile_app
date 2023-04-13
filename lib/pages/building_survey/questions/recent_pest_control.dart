import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class RecentPestControl extends StatelessWidget {
  RecentPestControl({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Has a pest control company applied any controls in the last 12 months?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
        child: Form(
          child: Obx(
            () => Column(
              children: [
                ...buildingController.recentPestControlTypes.map(
                  (item) => CheckboxListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(item['text'], style: const TextStyle(fontSize: 16)),
                    value: item['value'] ,
                    onChanged: (value) => {item['value'] = value!},
                  ),
                ),
                (buildingController.cookingTypes[2]['value'] == true)
                    ? Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextField(
                          style: const TextStyle(
                            color: Color.fromRGBO(187, 225, 250, 1.0),
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.pest_control,
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
                            hintText: 'Please enter the other type of pest control here',
                            hintStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13,
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                          ),
                          autocorrect: false,
                          onChanged: (value) {
                            buildingController.recentPestControlTypeOther.value = value;
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
