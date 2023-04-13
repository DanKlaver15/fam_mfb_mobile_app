import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';

class SmellTobaccoFreq extends StatelessWidget {
  SmellTobaccoFreq({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'How often (number of days per week) do you smell tobacco smoke in your building (from guests, clients, visitors)?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: TextField(
                  style: const TextStyle(
                    color: Color.fromRGBO(187, 225, 250, 1.0),
                    fontSize: 12,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.event,
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
                    hintText: 'Number of Days Per Week',
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  autocorrect: false,
                  onChanged: (value) {
                    buildingController.smellTobaccoFreq.value = int.parse(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
