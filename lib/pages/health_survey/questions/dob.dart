import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/health_survey_controller.dart';

class DOB extends StatelessWidget {
  DOB({Key? key}) : super(key: key);

  final HealthcareSurveyController healthSurveyController = Get.find<HealthcareSurveyController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'What is ${healthSurveyController.childName}\'s date of birth?',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                child: TextFormField(
                  controller: healthSurveyController.textEditingController,
                  style: const TextStyle(
                    color: Color.fromRGBO(187, 225, 250, 1.0),
                    fontSize: 13,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.calendar_today,
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
                    hintText: 'DOB',
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                    contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                  ),
                  readOnly: true,
                  onTap: () {
                    healthSurveyController.selectDate(context);
                    FocusScope.of(context).requestFocus(FocusNode());
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
