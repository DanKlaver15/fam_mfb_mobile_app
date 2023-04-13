import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/animated_background.dart';
import 'package:app/components/custom_appbar.dart';
import 'package:app/components/custom_spring_animation.dart';
import 'package:app/generated/assets.dart';
import 'package:app/pages/categories/indoor_air_quality/indoor_air_quality_infographics.dart';
import 'package:app/state/controllers/iaq_controller.dart';
import 'package:app/components/custom_card.dart';

class IAQPage extends StatefulWidget {
  const IAQPage({Key? key}) : super(key: key);

  @override
  State<IAQPage> createState() => _IAQPage();
}

class _IAQPage extends State<IAQPage> with SingleTickerProviderStateMixin {
  final IaqPageController iaqPageController = Get.put(IaqPageController(), permanent: true);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController controller = PageController();

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
                              PageView(
                                controller: controller,
                                physics: const CustomPageViewScrollPhysics(),
                                onPageChanged: (pageNum) {
                                  iaqPageController.page.value = pageNum;
                                },
                                children: <Widget>[
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomCard(
                                        title: null,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              const Image(
                                                image: AssetImage(Assets.images90PercentImage),
                                                alignment: Alignment.center,
                                              ),
                                              const Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                child: Text(
                                                  'Americans spend about 90% of their time indoors!\n\n'
                                                  'Concentrations of air pollutants can be 2-5x higher than outside.',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(187, 225, 250, 1.0),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 12),
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    elevation: 15,
                                                    backgroundColor: const Color.fromRGBO(50, 130, 184, 1),
                                                    shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.to(() => const IAQInfographicsWidget());
                                                  },
                                                  child: const Text(
                                                    'Learn More',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(187, 225, 250, 1.0),
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
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
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomCard(
                                        title: null,
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 20, 8, 30),
                                              child: Text(
                                                'How is your building heated?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(187, 225, 250, 1.0),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 15),
                                              child: Column(
                                                children: [
                                                  ...iaqPageController.buildingHeatTypes
                                                      .map((item) => RadioListTile(
                                                            title: Text(
                                                              item['text'],
                                                              style: const TextStyle(
                                                                color: Color.fromRGBO(187, 225, 250, 1.0),
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            activeColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                                            dense: true,
                                                            value: item['value'],
                                                            groupValue: iaqPageController.heatType.value,
                                                            onChanged: (value) {
                                                              iaqPageController.heatType.value = value as int;
                                                            },
                                                          ))
                                                      .toList(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomCard(
                                        title: null,
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 20, 8, 30),
                                              child: Text(
                                                'Opening windows, even in the winter helps with indoor air quality.\n\n Can the windows be opened in your building?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(187, 225, 250, 1.0),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 15),
                                              child: Column(
                                                children: [
                                                  ...iaqPageController.openWindowTypes
                                                      .map((item) => RadioListTile(
                                                            title: Text(
                                                              item['text'],
                                                              style: const TextStyle(
                                                                color: Color.fromRGBO(187, 225, 250, 1.0),
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            activeColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                                            dense: true,
                                                            value: item['value'],
                                                            groupValue: iaqPageController.heatType.value,
                                                            onChanged: (value) {
                                                              iaqPageController.heatType.value = value as int;
                                                            },
                                                          ))
                                                      .toList(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomCard(
                                        title: null,
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 20, 8, 30),
                                              child: Text(
                                                'Using plastic (AKA winterizing) on windows can improve energy efficiency, but it also seals in unhealthy air.\n\n Do you put plastic on your windows during winter?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(187, 225, 250, 1.0),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 15),
                                              child: Column(
                                                children: [
                                                  ...iaqPageController.plasticOnWindowsTypes
                                                      .map((item) => RadioListTile(
                                                            title: Text(
                                                              item['text'],
                                                              style: const TextStyle(
                                                                color: Color.fromRGBO(187, 225, 250, 1.0),
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                            activeColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                                            dense: true,
                                                            value: item['value'],
                                                            groupValue: iaqPageController.plasticOnWindowsType.value,
                                                            onChanged: (value) {
                                                              iaqPageController.plasticOnWindowsType.value = value as int;
                                                            },
                                                          ))
                                                      .toList(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomCard(
                                        title: null,
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(8, 20, 8, 30),
                                              child: Text(
                                                'Using plastic (AKA winterizing) on windows can improve energy efficiency, but it also seals in unhealthy air.\n\n Do you put plastic on your windows during winter?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(187, 225, 250, 1.0),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 15),
                                              child: Column(
                                                children: [
                                                  ...iaqPageController.plasticOnWindowsTypes
                                                      .map((item) => RadioListTile(
                                                    title: Text(
                                                      item['text'],
                                                      style: const TextStyle(
                                                        color: Color.fromRGBO(187, 225, 250, 1.0),
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    activeColor: const Color.fromRGBO(187, 225, 250, 1.0),
                                                    dense: true,
                                                    value: item['value'],
                                                    groupValue: iaqPageController.plasticOnWindowsType.value,
                                                    onChanged: (value) {
                                                      iaqPageController.plasticOnWindowsType.value = value as int;
                                                    },
                                                  ))
                                                      .toList(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),//heat type
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                                  child: DotsIndicator(
                                    dotsCount: iaqPageController.dotsCount.value,
                                    position: iaqPageController.page.value.toDouble(),
                                    decorator: DotsDecorator(
                                      size: const Size.square(9.0),
                                      activeSize: const Size(15.0, 9.0),
                                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
