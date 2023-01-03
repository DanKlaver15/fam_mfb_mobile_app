import 'package:flutter/material.dart';
import 'package:app/generated/assets.dart';
import '../../../custom_appbar.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'indoor_air_quality_infographics.dart';

class IAQPageWidget extends StatefulWidget {
  const IAQPageWidget({Key? key}) : super(key: key);

  @override
  _IAQPageWidget createState() => _IAQPageWidget();
}

class _IAQPageWidget extends State<IAQPageWidget>
    with AutomaticKeepAliveClientMixin<IAQPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PageController controller = PageController();
  int dotsCount = 17;
  int page = 0;
  int? heatType;
  int? openWindowType;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 0, 0, 0),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(3, 18, 3, 12),
                                          child: Card(
                                            color: const Color.fromRGBO(
                                                187, 225, 250, 1),
                                            elevation: 20,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            child: Column(
                                              children: [
                                                const Expanded(
                                                  child: Image(
                                                    image: AssetImage(Assets
                                                        .images90PercentImage),
                                                    alignment: Alignment.center,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 0),
                                                  child: Text(
                                                    'Americans spend about 90% of their time indoors!\n\n'
                                                    'Concentrations of air pollutants can be 2-5x higher than outside.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          0, 12, 0, 12),
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 15,
                                                      backgroundColor:
                                                          const Color.fromRGBO(
                                                              50, 130, 184, 1),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8)),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const IAQInfographicsWidget(),
                                                        ),
                                                      );
                                                    },
                                                    child: const Text(
                                                      'Learn More',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 3, 0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ), //infographic
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 0, 0, 0),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.8,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(3, 18, 3, 12),
                                          child: Card(
                                            color: const Color.fromRGBO(
                                                187, 225, 250, 1),
                                            elevation: 20,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            child: Column(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 20, 8, 0),
                                                  child: Text(
                                                    'How is your building heated?',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      //fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          27, 38, 44, 1),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    children: [
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Baseboard',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 15, 0, 0),
                                                        dense: true,
                                                        enableFeedback: true,
                                                        value: 1,
                                                        selected: true,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Fireplace',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 2,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Forced Air (vents)',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 3,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Radiator',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 4,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Space Heater',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 5,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Other',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 6,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'I don\'t know',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 7,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value!;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 3, 0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ), //heat type
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 0, 0, 0),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.8,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(3, 18, 3, 12),
                                          child: Card(
                                            color: const Color.fromRGBO(
                                                187, 225, 250, 1),
                                            elevation: 20,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            child: Column(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 20, 8, 0),
                                                  child: Text(
                                                    'Opening windows, even in the winter helps with indoor air quality.\n\n Can the windows be opened in your building?',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          27, 38, 44, 1),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    children: [
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Yes, we open regularly, even in winter',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 15, 0, 0),
                                                        dense: true,
                                                        enableFeedback: true,
                                                        value: 1,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Yes, we open when the weather is nice',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 2,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Yes, but we never open them',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 3,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'No',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 3,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 3, 0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ), //open window type
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 0, 0, 0),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1.8,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(3, 18, 3, 12),
                                          child: Card(
                                            color: const Color.fromRGBO(
                                                187, 225, 250, 1),
                                            elevation: 20,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            child: Column(
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 20, 8, 0),
                                                  child: Text(
                                                    'Using plastic (AKA winterizing) on windows can improve energy efficiency, but it also seals in unhealthy air.\n\n Do you put plastic on your windows during winter?',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          27, 38, 44, 1),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    children: [
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 15, 0, 0),
                                                        dense: true,
                                                        enableFeedback: true,
                                                        value: 1,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      RadioListTile(
                                                        title: const Align(
                                                          alignment: Alignment(
                                                              -1.15, 0),
                                                          child: Text(
                                                            'No',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      38,
                                                                      44,
                                                                      1),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                12, 0, 0, 0),
                                                        dense: true,
                                                        value: 2,
                                                        groupValue: heatType,
                                                        onChanged:
                                                            (int? value) {
                                                          setState(
                                                            () {
                                                              heatType = value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 3, 0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ), //plastic on windows
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 25),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
