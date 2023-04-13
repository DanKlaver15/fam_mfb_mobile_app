import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/onboarding_page_controller.dart';

class OnboardingFullName extends StatelessWidget {
  OnboardingFullName({Key? key}) : super(key: key);

  final onboardingPageController = Get.find<OnboardingPageController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'What is your first and last name?',
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 12,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
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
                  hintText: 'First Name',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                autocorrect: false,
                onChanged: (value) {
                  onboardingPageController.firstName.value = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 20),
              child: TextField(
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 13,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
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
                  hintText: 'Last Name',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                autocorrect: false,
                onChanged: (value) {
                  onboardingPageController.lastName.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
