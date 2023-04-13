import 'dart:ui';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';
import '../../state/controllers/loading_controller.dart';
import '../../state/controllers/login_controller.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin {
  final loadingController = Get.put(LoadingController(), permanent: true);
  final loginController = Get.put(LoginController(), permanent: true);

  final formKey = GlobalKey<FormState>();

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
    //homePageController.userPreviouslyLoggedIn();
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
                                                    loginController.email.value = value;
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
                                                  decoration: InputDecoration(
                                                    enabledBorder: const OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(15, 76, 117, 1.0), width: 2.0),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    focusedBorder: const OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color.fromRGBO(50, 130, 184, 1.0), width: 2.5),
                                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                                    ),
                                                    hintText: 'Password',
                                                    hintStyle: const TextStyle(color: Color.fromRGBO(50, 130, 184, 0.6), fontSize: 14),
                                                    filled: true,
                                                    fillColor: const Color.fromRGBO(27, 38, 44, 1.0),
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        loginController.hidePassword.value = !loginController.hidePassword.value;
                                                      },
                                                      icon: Icon(loginController.hidePassword.value ? Icons.visibility_off : Icons.visibility),
                                                    ),
                                                    suffixIconColor: const Color.fromRGBO(15, 76, 117, 1.0),
                                                  ),
                                                  obscureText: loginController.hidePassword.value,
                                                  autocorrect: false,
                                                  onChanged: (value) {
                                                    loginController.password.value = value;
                                                  },
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                    child: RichText(
                                                      textScaleFactor: 0.7,
                                                      text: TextSpan(
                                                        text: 'Forgot password?',
                                                        style: const TextStyle(
                                                          color: Color.fromRGBO(187, 225, 250, 0.75),
                                                        ),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {
                                                            //TODO: replace this with password reset
                                                            Get.off(() => const RegistrationPage());
                                                          },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                                  loginController.loginUser();
                                                }
                                              },
                                              child: const Text('Login', style: TextStyle(color: Color.fromRGBO(187, 225, 250, 1.0))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    RichText(
                                      textScaleFactor: 0.9,
                                      text: TextSpan(
                                        text: 'Don\'t have an account? ',
                                        style: const TextStyle(
                                          color: Color.fromRGBO(187, 225, 250, 1.0),
                                          fontFamily: Assets.fontsMontserratBlack,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Register',
                                            style: const TextStyle(
                                              color: Color.fromRGBO(50, 130, 184, 1.0),
                                              decoration: TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.off(() => const RegistrationPage());
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
