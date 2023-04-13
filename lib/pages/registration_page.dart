import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flurry_sdk/flurry.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:app/components/pdf_viewer_from_asset.dart';
import 'package:app/generated/assets.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/state/controllers/loading_controller.dart';
import 'package:app/state/controllers/registration_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> with SingleTickerProviderStateMixin {
  final loadingController = Get.find<LoadingController>();
  final registrationController = Get.put(RegistrationController());

  final formKey = GlobalKey<FormState>();
  final checkBoxKey = GlobalKey<FormState>();

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.3,
    minOpacity: 0.01,
    maxOpacity: 0.15,
    particleCount: 50,
    spawnMaxRadius: 10.0,
    spawnMaxSpeed: 25.0,
    spawnMinSpeed: 15.0,
    spawnMinRadius: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(15, 76, 117, 1),
              Color.fromRGBO(27, 38, 44, 1),
            ],
          ),
        ),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: AnimatedBackground(
                behaviour: RandomParticleBehaviour(options: particles),
                vsync: this,
                child: Obx(
                  () => Center(
                    child: (loadingController.isLoading.value)
                        ? BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Center(
                              child: Lottie.asset(Assets.lottiesBreathingLungs, width: 80, height: 80, repeat: true, animate: true),
                            ),
                          )
                        : SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: Get.height * 0.95),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(20, 18, 20, 50),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(Assets.imagesWhiteAppIconTransparentBg, width: 100, height: 100),
                                        const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                          child: Text(
                                            'Welcome 👋',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color.fromRGBO(187, 225, 250, 1.0),
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 50),
                                          child: Text(
                                            'to My Full Breath!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color.fromRGBO(187, 225, 250, 1.0),
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                        Form(
                                          key: formKey,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                child: TextField(
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(187, 225, 250, 1.0),
                                                    fontSize: 14,
                                                  ),
                                                  decoration: const InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(15, 76, 117, 1.0), width: 2.0),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(50, 130, 184, 1.0), width: 2.5),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    hintText: 'Email Address',
                                                    hintStyle: TextStyle(color: Color.fromRGBO(50, 130, 184, 0.6), fontSize: 14),
                                                    filled: true,
                                                    fillColor: Color.fromRGBO(27, 38, 44, 1.0),
                                                  ),
                                                  autocorrect: false,
                                                  onChanged: (value) {
                                                    registrationController.email.value = value;
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                child: TextField(
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(187, 225, 250, 1.0),
                                                    fontSize: 14,
                                                  ),
                                                  decoration: const InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(15, 76, 117, 1.0), width: 2.0),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(50, 130, 184, 1.0), width: 2.5),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    hintText: 'Password',
                                                    hintStyle: TextStyle(color: Color.fromRGBO(50, 130, 184, 0.6), fontSize: 14),
                                                    filled: true,
                                                    fillColor: Color.fromRGBO(27, 38, 44, 1.0),
                                                  ),
                                                  obscureText: true,
                                                  autocorrect: false,
                                                  onChanged: (value) {
                                                    registrationController.firstPassword.value = value;
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                                child: TextField(
                                                  style: const TextStyle(
                                                    color: Color.fromRGBO(187, 225, 250, 1.0),
                                                    fontSize: 14,
                                                  ),
                                                  decoration: const InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(15, 76, 117, 1.0), width: 2.0),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(50, 130, 184, 1.0), width: 2.5),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    hintText: 'Confirm Password',
                                                    hintStyle: TextStyle(color: Color.fromRGBO(50, 130, 184, 0.6), fontSize: 14),
                                                    filled: true,
                                                    fillColor: Color.fromRGBO(27, 38, 44, 1.0),
                                                  ),
                                                  obscureText: true,
                                                  autocorrect: false,
                                                  onChanged: (value) {
                                                    registrationController.secondPassword.value = value;
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
                                                child: Obx(
                                                  () => DropdownButton(
                                                    dropdownColor: const Color.fromRGBO(15, 76, 117, 1),
                                                    value: registrationController.userType.value,
                                                    style: const TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
                                                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                                    underline: Container(
                                                      height: 2,
                                                      color: const Color.fromRGBO(15, 76, 117, 1),
                                                    ),
                                                    isExpanded: true,
                                                    hint: const Text(
                                                      'Please select your reason for using this app',
                                                      style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0), fontSize: 12),
                                                    ),
                                                    items: registrationController.userTypes
                                                        .map((item) => DropdownMenuItem(
                                                              value: item['value'],
                                                              child: Text(item['text'], style: const TextStyle(fontSize: 13)),
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) {
                                                      registrationController.userType.value = value as int;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Obx(
                                                () => CheckboxListTile(
                                                  key: checkBoxKey,
                                                  value: registrationController.acceptedTerms.value,
                                                  side: const BorderSide(color: Color(0xFF9F9F9F)),
                                                  controlAffinity: ListTileControlAffinity.leading,
                                                  visualDensity: VisualDensity.compact,
                                                  contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                  title: RichText(
                                                    textScaleFactor: 0.9,
                                                    text: TextSpan(
                                                      text: 'I agree to the ',
                                                      style: const TextStyle(
                                                        color: Color.fromRGBO(187, 225, 250, 1.0),
                                                        fontFamily: Assets.fontsMontserratBlack,
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: 'EULA',
                                                          style: const TextStyle(
                                                            color: Color.fromRGBO(50, 130, 184, 1.0),
                                                            fontFamily: Assets.fontsMontserratBlack,
                                                            decoration: TextDecoration.underline,
                                                          ),
                                                          recognizer: TapGestureRecognizer()
                                                            ..onTap = () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      PDFViewerFromAsset(pdfAssetPath: Assets.pdfsEula, pdfTitle: 'End User License Agreement'),
                                                                ),
                                                              );
                                                              Flurry.logEventWithParameters('itemViewed', {'itemName': 'EULA'});
                                                            },
                                                        ),
                                                        const TextSpan(
                                                          text: ' and ',
                                                          style: TextStyle(
                                                            color: Color.fromRGBO(187, 225, 250, 1.0),
                                                            fontFamily: Assets.fontsMontserratBlack,
                                                          ),
                                                        ),
                                                        //TODO: add privacy policy
                                                        const TextSpan(
                                                          text: 'Privacy Policy',
                                                          style: TextStyle(
                                                            color: Color.fromRGBO(50, 130, 184, 1.0),
                                                            fontFamily: Assets.fontsMontserratBlack,
                                                            decoration: TextDecoration.underline,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  onChanged: (value) {
                                                    registrationController.onChangedCheckbox(value!);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 5, 0),
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: 55,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color.fromRGBO(15, 76, 117, 1.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                if (formKey.currentState!.validate()) {
                                                  registrationController.verifyPassword();
                                                  if (!registrationController.passwordMatch.value) {
                                                    registrationController.showMismatchedPasswordDialog();
                                                  } else if (!registrationController.passwordMeetsRequirements.value) {
                                                    registrationController.showMissingPasswordRequirementsDialog();
                                                  } else if (registrationController.passwordMatch.value &&
                                                      registrationController.passwordMeetsRequirements.value) {
                                                    registrationController.password.value = registrationController.firstPassword.value;
                                                    registrationController.registerUser();
                                                  }
                                                }
                                              },
                                              child: const Text('Register', style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    RichText(
                                      textScaleFactor: 0.9,
                                      text: TextSpan(
                                        text: 'Already have an account? ',
                                        style: const TextStyle(
                                          color: Color.fromRGBO(187, 225, 250, 1.0),
                                          fontFamily: Assets.fontsMontserratBlack,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Login',
                                            style: const TextStyle(
                                              color: Color.fromRGBO(50, 130, 184, 1.0),
                                              decoration: TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.off(() => const LoginPage());
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                )),
          ),
        ),
      ),
    ));
  }
}
