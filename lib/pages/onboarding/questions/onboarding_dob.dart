import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import '../../../../state/controllers/onboarding_page_controller.dart';

class OnboardingDOB extends StatelessWidget {
  OnboardingDOB({Key? key}) : super(key: key);

  final onboardingPageController = Get.find<OnboardingPageController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'What is your date of birth?',
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
              child: TextFormField(
                controller: onboardingPageController.textEditingController,
                style: const TextStyle(
                  color: Color.fromRGBO(187, 225, 250, 1.0),
                  fontSize: 13,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today,
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
                  hintText: 'DOB',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 13,
                  ),
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 10, 10, 10),
                ),
                readOnly: true,
                onTap: () {
                  onboardingPageController.selectDate(context);
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
