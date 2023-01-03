import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import '../../components/dialogs/login_modal.dart';
import '../../components/dialogs/registration_modal.dart';
import '../../models/user.dart';
import 'hive_controller.dart';
import 'loading_controller.dart';

class HomePageController extends GetxController {
  LoadingController loadingController = Get.find();

  final scaffoldKey = GlobalKey<ScaffoldState>().obs;

  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  void showRegistrationModal() {
    loadingController.endLoader();
    Get.dialog(
      const RegistrationModal(),
      barrierDismissible: true,
    );
  }

  void showLoginModal() {
    loadingController.endLoader();
    Get.dialog(
      LoginModal(),
      barrierDismissible: true,
    );
  }

  void userPreviouslyLoggedIn() async {
    HiveController hiveController = HiveController();
    User? user = await hiveController.readUserFromHive();
    if (user != null) {
      Get.toNamed('/dashboard');
    }
  }
}