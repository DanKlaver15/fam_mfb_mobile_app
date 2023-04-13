import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/animated_background.dart';
import 'package:app/components/custom_appbar.dart';
import 'package:app/components/custom_spring_animation.dart';
import 'package:app/components/submit_questions.dart';
import 'package:app/pages/health_survey/questions/allergy_test.dart';
import 'package:app/pages/health_survey/questions/asthma_diagnosis.dart';
import 'package:app/pages/health_survey/questions/child_bronchiolitis.dart';
import 'package:app/pages/health_survey/questions/child_covid.dart';
import 'package:app/pages/health_survey/questions/child_croup.dart';
import 'package:app/pages/health_survey/questions/child_name.dart';
import 'package:app/pages/health_survey/questions/child_race.dart';
import 'package:app/pages/health_survey/questions/dob.dart';
import 'package:app/pages/health_survey/questions/eczema.dart';
import 'package:app/pages/health_survey/questions/father_asthma.dart';
import 'package:app/pages/health_survey/questions/father_eczema.dart';
import 'package:app/pages/health_survey/questions/father_env_allergies.dart';
import 'package:app/pages/health_survey/questions/father_food_allergies.dart';
import 'package:app/pages/health_survey/questions/father_race.dart';
import 'package:app/pages/health_survey/questions/health_mold.dart';
import 'package:app/pages/health_survey/questions/mother_asthma.dart';
import 'package:app/pages/health_survey/questions/mother_eczema.dart';
import 'package:app/pages/health_survey/questions/mother_env_allergies.dart';
import 'package:app/pages/health_survey/questions/mother_food_allergies.dart';
import 'package:app/pages/health_survey/questions/mother_race.dart';
import 'package:app/pages/health_survey/questions/wheeze.dart';
import 'package:app/pages/health_survey/questions/wheeze_not_sick.dart';
import 'package:app/state/controllers/health_survey_controller.dart';
import 'package:app/state/controllers/login_controller.dart';

class HealthSurvey extends StatefulWidget {
  const HealthSurvey({Key? key}) : super(key: key);

  @override
  State<HealthSurvey> createState() => _HealthSurvey();
}

class _HealthSurvey extends State<HealthSurvey> with SingleTickerProviderStateMixin {
  final LoginController loginController = Get.find();
  final HealthcareSurveyController healthController = Get.put(HealthcareSurveyController());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          elevation: 30,
          hasBackButton: false,
        ),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(15, 76, 117, 1),
                Color.fromRGBO(27, 38, 44, 1),
              ],
            ),
          ),
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: CustomAnimatedBackground(
                behaviour: customBehavior,
                vsync: this,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 500,
                        child: Obx(
                          () => Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                                      child: Text(
                                        'The following background health questions will help us tailor this experience to you!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 18, fontWeight: FontWeight.w600, height: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              PageView(
                                controller: controller,
                                physics: const CustomPageViewScrollPhysics(),
                                onPageChanged: (pageNum) {
                                  healthController.page.value = pageNum;
                                },
                                children: <Widget>[
                                  if (loginController.userType.value == 2) ...[
                                    ChildName(),
                                    DOB(),
                                    AsthmaDiagnosis(),
                                    FatherAsthma(),
                                    MotherAsthma(),
                                    Eczema(),
                                    Wheeze(),
                                    WheezeNotSick(),
                                    AllergyTest(),
                                    MotherEnvAllergies(),
                                    MotherFoodAllergies(),
                                    MotherEczema(),
                                    FatherEnvAllergies(),
                                    FatherFoodAllergies(),
                                    FatherEczema(),
                                    HistoryCroup(),
                                    HistoryBronchiolitis(),
                                    HistoryCovid(),
                                    HealthMold(),
                                    ChildRace(),
                                    MotherRace(),
                                    FatherRace(),
                                  ],
                                  if (loginController.userType.value == 3) ...[
                                    AsthmaDiagnosis(),
                                    AllergyTest(),
                                  ],
                                  SubmitQuestions(isBuildingSurvey: false)
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 1),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                                    child: DotsIndicator(
                                      dotsCount: healthController.dotsCount.value,
                                      position: healthController.page.value.toDouble(),
                                      decorator: DotsDecorator(
                                        size: const Size.square(9.0),
                                        activeSize: const Size(18.0, 9.0),
                                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool get wantKeepAlive => true;
}
