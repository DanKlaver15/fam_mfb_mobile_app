import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class CookingType extends StatelessWidget {
  CookingType({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Select all the ways cooking is done in your building:',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
        child: Form(
          child: Obx(
            () => Column(
              children: [
                ...buildingController.cookingTypes.map(
                  (item) => CheckboxListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    title: Text(item['text'], style: const TextStyle(fontSize: 16)),
                    value: item['value'] ,
                    onChanged: (value) => {item['value'] = value!},
                  ),
                ),
                (buildingController.cookingTypes[4]['value'] == true)
                    ? Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: TextField(
                          style: const TextStyle(
                            color: Color.fromRGBO(187, 225, 250, 1.0),
                            fontSize: 12,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.restaurant,
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
                            hintText: 'Please enter the other cooking type here',
                            hintStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 13,
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                          ),
                          autocorrect: false,
                          onChanged: (value) {
                            buildingController.cookingTypeOther.value = value;
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
