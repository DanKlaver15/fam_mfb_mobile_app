import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/building_survey_controller.dart';
import 'package:intl/intl.dart';

class HoursOfOperation extends StatelessWidget {
  HoursOfOperation({Key? key}) : super(key: key);

  final BuildingSurveyController buildingController = Get.find<BuildingSurveyController>();

  final weekdayHoursOpen = TextEditingController();
  final weekdayHoursClose = TextEditingController();
  final saturdayHoursOpen = TextEditingController();
  final saturdayHoursClose = TextEditingController();
  final sundayHoursOpen = TextEditingController();
  final sundayHoursClose = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Hours of Operation (Times that children are in the building):',
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
        child: Column(
          children: [
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Weekdays',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: weekdayHoursOpen,
                      style: const TextStyle(
                        color: Color.fromRGBO(187, 225, 250, 1.0),
                        fontSize: 12,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.schedule,
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
                        hintText: 'Opening Time',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      ),
                      readOnly: true,
                      onTap: () async {
                        buildingController.selectOpenTime(context, weekdayHoursOpen, buildingController.weekdayHoursOpen);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 20),
                    child: TextFormField(
                      controller: weekdayHoursClose,
                      style: const TextStyle(
                        color: Color.fromRGBO(187, 225, 250, 1.0),
                        fontSize: 13,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.schedule,
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
                        hintText: 'Closing Time',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      ),
                      readOnly: true,
                      autocorrect: false,
                      onTap: () async {
                        buildingController.selectCloseTime(context, weekdayHoursClose, buildingController.weekdayHoursClose);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Saturdays',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: saturdayHoursOpen,
                      style: const TextStyle(
                        color: Color.fromRGBO(187, 225, 250, 1.0),
                        fontSize: 12,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.schedule,
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
                        hintText: 'Opening Time',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      ),
                      readOnly: true,
                      autocorrect: false,
                      onTap: () async {
                        buildingController.selectOpenTime(context, saturdayHoursOpen, buildingController.saturdayHoursOpen);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 20),
                    child: TextFormField(
                      controller: saturdayHoursClose,
                      style: const TextStyle(
                        color: Color.fromRGBO(187, 225, 250, 1.0),
                        fontSize: 13,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.schedule,
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
                        hintText: 'Closing Time',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      ),
                      readOnly: true,
                      autocorrect: false,
                      onTap: () async {
                        buildingController.selectCloseTime(context, saturdayHoursClose, buildingController.saturdayHoursClose);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Form(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sundays',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: sundayHoursOpen,
                      style: const TextStyle(
                        color: Color.fromRGBO(187, 225, 250, 1.0),
                        fontSize: 12,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.schedule,
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
                        hintText: 'Opening Time',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      ),
                      readOnly: true,
                      autocorrect: false,
                      onTap: () async {
                        buildingController.selectOpenTime(context, sundayHoursOpen, buildingController.sundayHoursOpen);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 20),
                    child: TextFormField(
                      controller: sundayHoursClose,
                      style: const TextStyle(
                        color: Color.fromRGBO(187, 225, 250, 1.0),
                        fontSize: 13,
                      ),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.schedule,
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
                        hintText: 'Closing Time',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 13,
                        ),
                        contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                      ),
                      readOnly: true,
                      autocorrect: false,
                      onTap: () async {
                        buildingController.selectCloseTime(context, sundayHoursClose, buildingController.sundayHoursClose);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
