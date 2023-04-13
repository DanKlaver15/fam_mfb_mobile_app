import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/components/formatted_number_field.dart';
import 'package:app/pages/dashboard_page.dart';
import 'package:app/state/controllers/onboarding_page_controller.dart';

class OnboardingPhone extends StatelessWidget {
  OnboardingPhone({Key? key}) : super(key: key);

  final onboardingPageController = Get.find<OnboardingPageController>();

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'What is your phone number?',
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
              child: FormattedNumberField(
                separator: '-',
                onChange: () {},
                finalValue: onboardingPageController.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
              child: ElevatedButton(
                onPressed: () async {
                  int? statusCode = await onboardingPageController.markOnboardingComplete();
                  if (statusCode == 200) {
                    Get.offAll(() => const DashboardPage());
                  }
                },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
