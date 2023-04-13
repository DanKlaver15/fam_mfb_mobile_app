import 'dart:async';
import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_appbar.dart';
import 'package:app/generated/assets.dart';
import 'package:app/state/controllers/iaq_controller.dart';

class IAQInfographicsWidget extends StatefulWidget {
  const IAQInfographicsWidget({Key? key}) : super(key: key);

  @override
  State<IAQInfographicsWidget> createState() => _IAQInfographicsWidget();
}

class _IAQInfographicsWidget extends State<IAQInfographicsWidget> with SingleTickerProviderStateMixin {
  final IaqPageController iaqPageController = Get.find();

  PageController controller = PageController();
  int dotsCount = 17;
  int page = 0;

  late final AnimationController controllerAnimation = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<AlignmentGeometry> alignmentAnimation = Tween<AlignmentGeometry>(
    begin: Alignment.centerRight,
    end: Alignment.center,
  ).animate(
    CurvedAnimation(
      parent: controllerAnimation,
      curve: Curves.decelerate,
    ),
  );

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(
      const Duration(milliseconds: 600),
      () {
        iaqPageController.setSwipeAnimation();
      },
    );
  }

  @override
  void dispose() {
    controllerAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          elevation: 30,
          hasBackButton: true,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Stack(
                        children: [
                          PageView(
                            controller: controller,
                            onPageChanged: (pageNum) {
                              setState(
                                () {
                                  page = pageNum;
                                },
                              );
                            },
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityIaq1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*2*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityIaq2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*3*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualitySMAirPollutionInfographicPage1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*4*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualitySMAirPollutionInfographicPage2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*5*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityStrongSmells1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*6*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityStrongSmells2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*7*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityVocs1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*8*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityVocs2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*9*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityParticulateMatterPage1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*10*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityParticulateMatterPage2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*11*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityGasStoves,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*12*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityTobaccoAsthma1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*13*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityTobaccoAsthma2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*14*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityECigarettes1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*15*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityECigarettes2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*16*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityExhaust1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              /*17*/ Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(187, 225, 250, 1),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${page + 1} of 17',
                                              ),
                                              Image.asset(
                                                Assets.indoorAirQualityExhaust2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (iaqPageController.showSwipeAnimation.value) ...[
                                  BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                                    blendMode: BlendMode.srcATop,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                          child: Text(
                                            'Swipe',
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(50, 130, 184, 1)),
                                          ),
                                        ),
                                        AlignTransition(
                                          alignment: alignmentAnimation,
                                          child: const Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 25, 0),
                                            child: Icon(Icons.pan_tool_alt, size: 60, color: Color.fromRGBO(50, 130, 184, 1)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 25),
                      child: DotsIndicator(
                        dotsCount: dotsCount,
                        position: page.toDouble(),
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(15.0, 9.0),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          activeColor: const Color.fromRGBO(50, 130, 184, 1),
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
    );
  }
}
