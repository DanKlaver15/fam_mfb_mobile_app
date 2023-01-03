import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../components/pages/dashboard_page.dart';
import '../../components/pages/redcap_consent_page.dart';
import '../../models/user.dart';
import './auth_controller.dart';
import './loading_controller.dart';

class LoginModalController extends GetxController {
  LoadingController loadingController = Get.find();

  final formKey = GlobalKey<FormState>();
  var email = ''.obs;
  var password = ''.obs;

  void loginUser() async {
    try {
      User? user = await login(email.value, password.value);
      if (user != null) {
        var box = await Hive.openBox('myFullBreath');
        box.put('userId', user.userId);
        box.put('email', user.email);
        box.put('firstName', user.firstName);
        box.put('lastName', user.lastName);
        loadingController.endLoader();
        if (user.isEmailVerifiedFlag) {
          if (user.isOnboardedFlag) {
            Get.to(() => RedcapConsentPage(userId: user.userId,));
          } else {
            Get.to(() => const DashboardPage());
          }
        } else {
          Get.defaultDialog(
            title: 'Email not verified',
            middleText: 'Please verify your email before logging in.',
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            backgroundColor: const Color.fromRGBO(50, 130, 184, 1),
            onConfirm: () {
              Get.back();
            },
          );
        }
      } else {
        loadingController.endLoader();
        showLoginError();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void showLoginError() {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              color: const Color.fromRGBO(27, 38, 44, 1).withOpacity(0.7),
              elevation: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Unable to login. Please try again.",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        backgroundColor: Colors.transparent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    Future<void>.delayed(
      const Duration(seconds: 3),
      () {
        Get.back();
      },
    );
  }
}
