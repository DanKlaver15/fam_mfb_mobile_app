import 'package:flutter/material.dart';
import 'package:app/generated/assets.dart';
import '../../../components/custom_appbar.dart';
import 'package:dots_indicator/dots_indicator.dart';

class IAQInfographicsWidget extends StatefulWidget {
  const IAQInfographicsWidget({Key? key}) : super(key: key);

  @override
  _IAQInfographicsWidget createState() => _IAQInfographicsWidget();
}

class _IAQInfographicsWidget extends State<IAQInfographicsWidget> {
  PageController controller = PageController();
  int dotsCount = 17;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          elevation: 30,
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
                              /*1*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*2*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*3*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*4*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*5*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*6*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*7*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*8*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*9*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*10*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*11*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*12*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*13*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*14*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*15*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*16*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                              /*17*/Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //create a scrollable image
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                        child: Container(
                                          color: const Color.fromRGBO(
                                              187, 225, 250, 1),
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
                          ), //infographic//plastic on windows
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 25),
                      child: DotsIndicator(
                        dotsCount: dotsCount,
                        position: page.toDouble(),
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
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
