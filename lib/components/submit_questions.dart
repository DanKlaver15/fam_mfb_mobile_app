import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/pages/dashboard_page.dart';
import 'package:app/state/controllers/building_survey_controller.dart';
import 'package:app/state/controllers/health_survey_controller.dart';
import 'package:app/state/controllers/login_controller.dart';

class SubmitQuestions extends StatelessWidget {
  SubmitQuestions({Key? key, required this.isBuildingSurvey}) : super(key: key);

  final bool isBuildingSurvey;
  final LoginController loginController = Get.find();
  final BuildingSurveyController buildingController = Get.put(BuildingSurveyController());
  final HealthcareSurveyController healthController = Get.put(HealthcareSurveyController());

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Please ensure that you have completed all questions before submitting your answers',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Form(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      int? statusCode = await (isBuildingSurvey
                          ? buildingController.submitResponses(loginController.userId.value)
                          : healthController.submitResponses(loginController.userId.value));
                      if (statusCode == 200) {
                        Get.offAll(() => const DashboardPage());
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
                ((isBuildingSurvey && !buildingController.allQuestionsCompleted.value) || (!isBuildingSurvey && !healthController.allQuestionsCompleted.value))
                    ? const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Text(
                          'please complete all the questions before submitting',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.italic,
                          ),
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
