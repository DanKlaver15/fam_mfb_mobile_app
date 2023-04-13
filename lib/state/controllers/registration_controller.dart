import 'dart:async';

import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';

import '../../components/dialogs/add_user_result.dart';
import 'package:app/pages/login_page.dart';
import 'loading_controller.dart';
import 'services/registration_service_controller.dart';

class RegistrationController extends GetxController {
  final loadingController = Get.find<LoadingController>();

  final email = ''.obs;
  final acceptedTerms = false.obs;
  final submitWithoutTerms = false.obs;
  final userType = Rxn<int>();
  final counter = 0.obs;

  final password = ''.obs;
  final firstPassword = ''.obs;
  final secondPassword = ''.obs;
  final passwordMatch = true.obs;
  final passwordMeetsRequirements = true.obs;

  final List<Map> userTypes = [
    {'value': 1, 'text': 'Childcare Center/Facility recruited for research study'},
    {'value': 2, 'text': 'Parent of a child with Asthma recruited for research study'},
    {'value': 3, 'text': 'Neither of the above but are interested in learning more about Asthma'},
  ];

  void onChangedCheckbox(value) {
    if (counter.value > 0) {
      submitWithoutTerms.value = false;
    }
    acceptedTerms.value = value!;
  }

  void showMismatchedPasswordDialog() {
    Timer? timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      Get.back();
    });
    Get.defaultDialog(
      title: '',
      titlePadding: const EdgeInsets.all(0.0),
      backgroundColor: const Color.fromRGBO(15, 76, 117, 1.0),
      middleText: '',
      radius: 10.0,
      barrierDismissible: false,
      content: const Center(
        child: Text(
          'Passwords do not match!',
          style: TextStyle(
            color: Color.fromRGBO(187, 225, 250, 1.0),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ).then((value) {
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });
  }

  void showMissingPasswordRequirementsDialog() {
    Timer? timer = Timer.periodic(const Duration(milliseconds: 4000), (timer) {
      Get.back();
    });
    Get.defaultDialog(
      title: 'Password does not meet all requirements!',
      titleStyle: const TextStyle(
        color: Color.fromRGBO(187, 225, 250, 1.0),
      ),
      backgroundColor: const Color.fromRGBO(15, 76, 117, 1.0),
      middleText:
          'Passwords must contain between 8 and 30 characters,\nat least one digit,\nat least one uppercase letter,\nat least one lowercase letter,\nand at least one special character(!#\$%&*).',
      middleTextStyle: const TextStyle(
        color: Color.fromRGBO(187, 225, 250, 1.0),
        fontSize: 14,
      ),
      radius: 10.0,
      barrierDismissible: false,
    ).then((value) {
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });
  }

  void showAddUserResponse(int statusCode) async {
    Timer? timer = Timer.periodic(const Duration(milliseconds: 3000), (timer) {
      Get.back();
      if (statusCode == 201) {
        Get.off(() => const LoginPage());
      }
    });
    Get.dialog(AddUserResultModal(
      statusCode: statusCode,
    )).then((value) {
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });
  }

  void verifyPassword() {
    if (firstPassword.value != secondPassword.value) {
      passwordMatch.value = false;
    } else {
      passwordMatch.value = true;
      if (8 <= firstPassword.value.length &&
          firstPassword.value.length <= 30 &&
          firstPassword.value.contains(RegExp(r'[A-Z]')) &&
          firstPassword.value.contains(RegExp(r'[a-z]')) &&
          firstPassword.value.contains(RegExp(r'\d')) &&
          firstPassword.value.contains(RegExp(r'[!#$%&*]'))) {
        passwordMeetsRequirements.value = true;
      } else {
        passwordMeetsRequirements.value = false;
      }
    }
  }

  void registerUser() async {
    if (!acceptedTerms.value) {
      submitWithoutTerms.value = true;
      counter.value++;
    } else {
      submitWithoutTerms.value = false;
      counter.value = 0;
    }
    if (!submitWithoutTerms.value) {
      loadingController.startLoader();
      counter.value++;

      Tuple2<String?, int> response = await addUser(email.value, password.value, userType.value!);
      if (response.item2 == 201) {
        await sendEmailVerification(email.value);
      }

      acceptedTerms.value = false;
      submitWithoutTerms.value = false;
      loadingController.endLoader();

      showAddUserResponse(response.item2);
    }
  }

  onPageDispose() {
    acceptedTerms.value = false;
    submitWithoutTerms.value = false;
    counter.value = 0;
  }
}
