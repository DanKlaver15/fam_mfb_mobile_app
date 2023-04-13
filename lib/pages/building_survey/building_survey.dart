import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/animated_background.dart';
import 'package:app/components/custom_appbar.dart';
import 'package:app/components/custom_spring_animation.dart';
import 'package:app/components/submit_questions.dart';
import 'package:app/pages/building_survey/questions/allowable_enrollment.dart';
import 'package:app/pages/building_survey/questions/building_type.dart';
import 'package:app/pages/building_survey/questions/center_asthma_policy.dart';
import 'package:app/pages/building_survey/questions/childcare_type.dart';
import 'package:app/pages/building_survey/questions/cleaning_service.dart';
import 'package:app/pages/building_survey/questions/cooking_type.dart';
import 'package:app/pages/building_survey/questions/head_start.dart';
import 'package:app/pages/building_survey/questions/hours_of_operation.dart';
import 'package:app/pages/building_survey/questions/hvac_maintenance.dart';
import 'package:app/pages/building_survey/questions/mold_in_building.dart';
import 'package:app/pages/building_survey/questions/other_accreditation.dart';
import 'package:app/pages/building_survey/questions/pet_in_building.dart';
import 'package:app/pages/building_survey/questions/smell_tobacco_frequency.dart';
import 'package:app/pages/building_survey/questions/smoke_in_building.dart';
import 'package:app/pages/building_survey/questions/recent_pest_control.dart';
import 'package:app/state/controllers/building_survey_controller.dart';
import 'package:app/state/controllers/login_controller.dart';

class BuildingSurvey extends StatefulWidget {
  const BuildingSurvey({Key? key}) : super(key: key);

  @override
  State<BuildingSurvey> createState() => _BuildingSurvey();
}

class _BuildingSurvey extends State<BuildingSurvey> with SingleTickerProviderStateMixin {
  final LoginController loginController = Get.find();
  final BuildingSurveyController buildingSurveyController = Get.put(BuildingSurveyController());

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
                child: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          height: 500,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                                      child: Text(
                                        'Information about the building in which ${loginController.userType.value == 1 ? 'your childcare center is located.' : 'you live.'}',
                                        textAlign: TextAlign.center,
                                        style:
                                            const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 18, fontWeight: FontWeight.w600, height: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              PageView(
                                controller: controller,
                                physics: const CustomPageViewScrollPhysics(),
                                onPageChanged: (pageNum) {
                                  buildingSurveyController.page.value = pageNum;
                                },
                                children: <Widget>[
                                  if (loginController.userType.value == 1) ...[
                                    BuildingType(),
                                    ChildcareType(),
                                    HeadStart(),
                                    OtherAccreditation(),
                                    const CenterAsthmaPolicy(),
                                    TotalAllowableEnrollment(),
                                    HoursOfOperation(),
                                    CleaningService(),
                                    HvacMaintenance(),
                                    SmokeInBuilding(),
                                    SmellTobaccoFreq(),
                                    PetInBuilding(),
                                    CookingType(),
                                    RecentPestControl(),
                                    MoldInBuilding(),
                                  ],
                                  if (loginController.userType.value == 2 || loginController.userType.value == 3) ...[
                                    BuildingType(),
                                    HvacMaintenance(),
                                    SmokeInBuilding(),
                                    SmellTobaccoFreq(),
                                    PetInBuilding(),
                                    CookingType(),
                                    RecentPestControl(),
                                    MoldInBuilding(),
                                  ],
                                  SubmitQuestions(isBuildingSurvey: true),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                                  child: DotsIndicator(
                                    dotsCount: buildingSurveyController.dotsCount.value,
                                    position: buildingSurveyController.page.value.toDouble(),
                                    decorator: DotsDecorator(
                                      size: const Size.square(9.0),
                                      activeSize: const Size(18.0, 9.0),
                                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }

  bool get wantKeepAlive => true;
}
