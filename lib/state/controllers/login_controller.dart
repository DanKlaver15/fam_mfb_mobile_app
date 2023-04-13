import 'dart:ui';

import 'package:app/pages/onboarding/onboarding_page.dart';
import 'package:f_logs/f_logs.dart' as log;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flurry_sdk/flurry.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tuple/tuple.dart';

import '../../models/user.dart';
import './auth_controller.dart';
import './loading_controller.dart';
import 'package:app/pages/dashboard_page.dart';
import 'package:app/pages/redcap_consent_page.dart';

class LoginController extends GetxController {
  LoadingController loadingController = Get.find();

  final formKey = GlobalKey<FormState>();
  var email = ''.obs;
  var password = ''.obs;
  var hidePassword = true.obs;
  var userType = 1.obs;
  var userId = ''.obs;

  exportLogs() async {
    await log.FLog.exportLogs();
  }

  ///Logs in the user and adds their record to the local SQLite database
  void loginUser() async {
    loadingController.startLoader();
    try {
      Tuple2<User?, String?> response = await login(email.value, password.value);
      User? user = response.item1;
      if (user != null) {
        log.FLog.info(text: 'User logged in successfully', methodName: 'loginUser');
        userType.value = user.userType;
        userId.value = user.userId;

        var databasesPath = await getDatabasesPath();
        String path = join(databasesPath, 'myFullBreath.db');
        Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
          // When creating the db, create the table if it doesn't already exist.
          await db.execute('''
                  CREATE TABLE IF NOT EXISTS "USER" (
                  "USER_ID" text NOT NULL,
                  "USER_TYPE" integer NOT NULL,
                  "TOKEN" text NOT NULL,
                  "FIRST_TIME_OPENING" integer NOT NULL DEFAULT "1",
                  PRIMARY KEY ("USER_ID"));
                  ''');
        });
        await database.transaction((txn) async {
          await txn.rawInsert('''
                   INSERT OR IGNORE INTO USER (USER_ID, USER_TYPE, TOKEN, FIRST_TIME_OPENING)
                   VALUES ("${user.userId}", ${user.userType}, "${response.item2}", 1);
          ''');
        });

        loadingController.endLoader();
        if (user.isEmailVerifiedFlag) {
          if (!user.isOnboardedFlag) {
            if (user.userType == 2) {
              Get.to(() => const OnboardingPage());
              Get.to(() => RedcapConsentPage(
                    userId: user.userId,
                  ));
              Flurry.logTimedEventWithParameters('contentViewed', {'timeSpentOnConsent': 'startTime'}, true);
            } else {
              Get.to(() => const OnboardingPage());
            }
          } else {
            Get.to(() => const DashboardPage());
          }
        } else {
          Get.defaultDialog(
            title: 'Email not verified',
            middleText: 'Please verify your email before logging in.',
            textConfirm: 'OK',
            confirmTextColor: const Color.fromRGBO(187, 225, 250, 1.0),
            radius: 10.0,
            backgroundColor: const Color.fromRGBO(15, 76, 117, 1.0),
            contentPadding: const EdgeInsets.all(10.0),
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
      loadingController.endLoader();
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
                    'Unable to login. Please try again.',
                    style: TextStyle(fontSize: 18, color: Colors.white, backgroundColor: Colors.transparent),
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
