import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app/components/custom_card.dart';
import 'package:app/state/controllers/childcare_centers_controller.dart';
import 'package:app/state/controllers/onboarding_page_controller.dart';
import 'package:app/models/childcare_centers/center.dart';

class OnboardingChildcareCenters extends StatelessWidget {
  OnboardingChildcareCenters({Key? key}) : super(key: key);

  final childcareCenterController = Get.find<ChildcareCenterController>();
  final onboardingPageController = Get.find<OnboardingPageController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    childcareCenterController.getCenters();

    return CustomCard(
      title: 'What childcare center do you work at?',
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
              child: Obx(
                () => DropdownButton(
                  dropdownColor: const Color.fromRGBO(15, 76, 117, 1),
                  value: childcareCenterController.center.value,
                  style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  underline: Container(
                    height: 2,
                    color: const Color.fromRGBO(15, 76, 117, 1),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Center',
                    style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
                  ),
                  items: childcareCenterController.centerList
                      .map((item) => DropdownMenuItem(
                            value: item['value'],
                            child: Text(item['text'], style: const TextStyle(fontSize: 13)),
                          ))
                      .toList(),
                  onChanged: (value) {
                    childcareCenterController.center.value = value as int;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
