import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class CenterAsthmaPolicy extends StatefulWidget {
  const CenterAsthmaPolicy({super.key});

  @override
  State<CenterAsthmaPolicy> createState() => _CenterAsthmaPolicy();
}

class _CenterAsthmaPolicy extends State<CenterAsthmaPolicy> {
  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title:
          'In addition to state licensing requirements, has your childcare center created policies or rules in any of the following areas related to asthma and/or indoor air quality?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Form(
          child: Column(
            children: buildingController.centerAsthmaPolicies
                .map(
                  (item) => CheckboxListTile(
                    title: Text(
                      item['text'],
                      style: const TextStyle(
                        color: Color.fromRGBO(187, 225, 250, 1.0),
                      ),
                    ),
                    value: item['value'],
                    onChanged: (value) => {
                      setState(() {
                        item['value'] = value;
                      }),
                      // if (value != null && value)
                      //   {buildingController.centerAsthmaPolicy.add(item['text'])}
                      // else if (value != null && !value)
                      //   {buildingController.centerAsthmaPolicy.remove(item['text'])}
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
