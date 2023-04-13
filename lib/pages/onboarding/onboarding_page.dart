import 'package:app/state/controllers/login_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/animated_background.dart';
import 'package:app/components/custom_appbar.dart';
import 'package:app/components/custom_spring_animation.dart';
import 'package:app/pages/onboarding/questions/onboarding_address.dart';
import 'package:app/pages/onboarding/questions/onboarding_address_short.dart';
import 'package:app/pages/onboarding/questions/onboarding_childcare_centers.dart';
import 'package:app/pages/onboarding/questions/onboarding_dob.dart';
import 'package:app/pages/onboarding/questions/onboarding_full_name.dart';
import 'package:app/pages/onboarding/questions/onboarding_phone.dart';
import 'package:app/state/controllers/childcare_centers_controller.dart';
import 'package:app/state/controllers/onboarding_page_controller.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> with SingleTickerProviderStateMixin {
  final LoginController loginController = Get.find();
  final ChildcareCenterController childcareCenterController = Get.put(ChildcareCenterController());
  final OnboardingPageController onboardingPageController = Get.put(OnboardingPageController());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    childcareCenterController.getCenters();

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
                                        'We just need a few more pieces of information to get you started.',
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
                                  onboardingPageController.page.value = pageNum;
                                },
                                children: <Widget>[
                                  OnboardingFullName(),
                                  OnboardingDOB(),
                                  if (onboardingPageController.userType.value == 2) OnboardingAddress(),
                                  if (onboardingPageController.userType.value == 3) OnboardingAddressShort(),
                                  if (onboardingPageController.userType.value == 1) OnboardingChildcareCenters(),
                                  if (onboardingPageController.userType.value == 1 || onboardingPageController.userType.value == 2) OnboardingPhone(),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                                  child: DotsIndicator(
                                    dotsCount: onboardingPageController.dotsCount.value,
                                    position: onboardingPageController.page.value.toDouble(),
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
