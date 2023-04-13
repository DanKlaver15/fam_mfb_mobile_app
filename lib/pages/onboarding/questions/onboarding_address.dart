import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../state/controllers/onboarding_page_controller.dart';
import '../../../../utils/list_us_states.dart';
import 'package:app/components/custom_card.dart';

class OnboardingAddress extends StatelessWidget {
  OnboardingAddress({Key? key}) : super(key: key);

  final onboardingPageController = Get.find<OnboardingPageController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'What is your home address?',
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 12,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(15, 76, 117, 1.0), width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15.0,
                      ),
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
                  hintText: 'Address 1',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                autocorrect: false,
                onChanged: (value) {
                  onboardingPageController.address1.value = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 12,
                ),
                decoration: const InputDecoration(
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
                  hintText: 'Address 2',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                autocorrect: false,
                onChanged: (value) {
                  onboardingPageController.address2.value = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 12,
                ),
                decoration: const InputDecoration(
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
                  hintText: 'City',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                autocorrect: false,
                onChanged: (value) {
                  onboardingPageController.city.value = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
              child: DropdownButtonFormField<String>(
                value: (onboardingPageController.state.value == '') ? null : onboardingPageController.state.value,
                decoration: const InputDecoration(
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
                  hintText: 'State',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(187, 225, 250, 1.0),
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 13,
                ),
                isExpanded: true,
                hint: const Text(
                  'State',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                ),
                dropdownColor: const Color.fromRGBO(27, 38, 44, 1.0),
                onChanged: (value) {
                  onboardingPageController.state.value = value!;
                },
                items: statesList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 15),
              child: TextFormField(
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 12,
                ),
                decoration: const InputDecoration(
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
                  hintText: 'Zip',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                autocorrect: false,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty || value.length != 5 || !onboardingPageController.zipExpression.hasMatch(value)) {
                    return 'Please enter a valid zip code';
                  }
                  return null;
                },
                onChanged: (value) {
                  onboardingPageController.zip.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
