import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_appbar.dart';
import 'package:app/components/custom_drawer.dart';
import 'package:app/components/icon_grey_overlay.dart';
import 'package:app/generated/assets.dart';
import 'package:app/pages/building_survey/building_survey.dart';
import 'package:app/pages/categories/indoor_air_quality/indoor_air_quality.dart';
import 'package:app/pages/health_survey/health_survey.dart';
import 'package:app/state/controllers/dashboard_controller.dart';
import 'package:app/state/controllers/login_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  State<DashboardPage> createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final LoginController loginController = Get.find();
  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          elevation: 0,
          hasDrawer: true,
        ),
      ),
      drawer: const CustomDrawer(),
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
            left: false,
            right: false,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: LayoutBuilder(
                builder: (context, constraints) => GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: constraints.biggest.aspectRatio * 3 / 1.8,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 25, 25, 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(50, 130, 184, 1),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 20,
                              color: Colors.black26,
                              offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 15,
                          ),
                          onPressed: () {
                            !dashboardController.completedBuildingSurvey.value ? Get.to(() => const BuildingSurvey()) : null;
                          },
                          child: LayoutBuilder(
                            builder: (context, constraints) => Column(
                              //mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: constraints.biggest.height * 0.4,
                                  child: const Center(
                                    child: CircleAvatar(
                                      backgroundColor: Color.fromRGBO(187, 225, 250, 1.0),
                                      maxRadius: 35,
                                      child: CircleAvatar(
                                        maxRadius: 30,
                                        child: Icon(
                                          Icons.apartment,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: constraints.biggest.height * 0.4,
                                  child: Center(
                                    child: Text(
                                      '${loginController.userType.value == 1 ? 'Building' : 'Home'} Survey',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (loginController.userType.value == 2 || loginController.userType.value == 3)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(15, 25, 25, 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(50, 130, 184, 1),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black26,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 15,
                            ),
                            onPressed: () {
                              !dashboardController.completedHealthSurvey.value ? Get.to(() => const HealthSurvey()) : null;
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: const Center(
                                      child: CircleAvatar(
                                        backgroundColor: Color.fromRGBO(187, 225, 250, 1.0),
                                        maxRadius: 35,
                                        child: CircleAvatar(
                                          maxRadius: 30,
                                          child: Icon(
                                            Icons.medical_information,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: const Center(
                                      child: Text(
                                        'Health Survey',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 15, 15),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: dashboardController.setEnvCardBackground(),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black26,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 15,
                            ),
                            onPressed: () {
                              dashboardController.completedBuildingSurvey.value && dashboardController.completedHealthSurvey.value
                                  ? Get.to(() => const IAQPage())
                                  : null;
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                        maxRadius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(Assets.iconsIAQIcon),
                                          maxRadius: 30,
                                          child: !dashboardController.completedBuildingSurvey.value ? const IconOverlay() : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: Text(
                                        'Indoor Air Quality',
                                        style: TextStyle(
                                          color: dashboardController.setCardText(),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 25, 25, 15),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: dashboardController.setEnvCardBackground(),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black26,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 15,
                            ),
                            onPressed: () {
                              null;
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                        maxRadius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(Assets.iconsMold),
                                          maxRadius: 30,
                                          child: !dashboardController.completedBuildingSurvey.value ? const IconOverlay() : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: Text(
                                        'Mold',
                                        style: TextStyle(
                                          color: dashboardController.setCardText(),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(25, 15, 15, 15),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: dashboardController.setEnvCardBackground(),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black26,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 15,
                            ),
                            onPressed: () {
                              null;
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                        maxRadius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(Assets.iconsRoach),
                                          maxRadius: 30,
                                          child: !dashboardController.completedBuildingSurvey.value ? const IconOverlay() : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: Text(
                                        'Cockroaches',
                                        style: TextStyle(
                                          color: dashboardController.setCardText(),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 25, 15),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: dashboardController.setEnvCardBackground(),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black26,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 15,
                            ),
                            onPressed: () {
                              null;
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                        maxRadius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(Assets.iconsDustMite),
                                          maxRadius: 30,
                                          child: !dashboardController.completedBuildingSurvey.value ? const IconOverlay() : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: Text(
                                        'Dust Mites',
                                        style: TextStyle(
                                          color: dashboardController.setCardText(),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(25, 15, 15, 25),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: dashboardController.setEnvCardBackground(),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black26,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 15,
                            ),
                            onPressed: () {
                              null;
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                        maxRadius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(Assets.iconsDog),
                                          maxRadius: 30,
                                          child: !dashboardController.completedBuildingSurvey.value ? const IconOverlay() : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: Text(
                                        'Pets',
                                        style: TextStyle(
                                          color: dashboardController.setCardText(),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
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
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 25, 25),
                      child: Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            color: dashboardController.setEnvCardBackground(),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black26,
                                offset: Offset(10, 10),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 15,
                            ),
                            onPressed: () {
                              null;
                            },
                            child: LayoutBuilder(
                              builder: (context, constraints) => Column(
                                //mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                        maxRadius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(Assets.iconsRodent),
                                          maxRadius: 30,
                                          child: !dashboardController.completedBuildingSurvey.value ? const IconOverlay() : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.biggest.height * 0.4,
                                    child: Center(
                                      child: Text(
                                        'Rodents',
                                        style: TextStyle(
                                          color: dashboardController.setCardText(),
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.center,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
