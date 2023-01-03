import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';
import '../../state/controllers/loading_controller.dart';
import '../../state/controllers/login_modal_controller.dart';
import './password_reset_modal.dart';

class LoginModal extends StatelessWidget {
  LoginModal({Key? key}) : super(key: key);

  final LoginModalController loginModalController =
      Get.put(LoginModalController(), permanent: true);
  final LoadingController loadingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(
                20, 0, 20, MediaQuery.of(context).viewInsets.bottom),
            color: const Color.fromRGBO(27, 38, 44, 1).withOpacity(0.7),
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => (loadingController.isLoading.value)
                          ? Lottie.asset(Assets.lottiesBreathingLungs,
                              width: 80,
                              height: 80,
                              repeat: true,
                              animate: true)
                          : Form(
                              key: loginModalController.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 20, 15, 0),
                                    child: TextField(
                                      style: const TextStyle(
                                        fontFamily: Assets.fontsMontserratBlack,
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(15, 76, 117, 1),
                                      ),
                                      autocorrect: false,
                                      onChanged: (value) {
                                        loginModalController.email.value =
                                            value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            15, 20, 15, 0),
                                    child: TextField(
                                      style: const TextStyle(
                                        fontFamily: Assets.fontsMontserratBlack,
                                        color: Color(0xFFE5E5E5),
                                      ),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Password',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(15, 76, 117, 1),
                                      ),
                                      obscureText: true,
                                      autocorrect: false,
                                      onChanged: (value) {
                                        loginModalController.password.value =
                                            value;
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 30, 20, 20),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            elevation: 15,
                                          ),
                                          onPressed: () async {
                                            loadingController.startLoader();
                                            loginModalController.loginUser();
                                          },
                                          child: const Text(
                                            'Sign In',
                                            style: TextStyle(
                                              fontFamily:
                                                  Assets.fontsMontserratBlack,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: Column(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            padding: const EdgeInsets.all(0),
                                            visualDensity:
                                                VisualDensity.compact,
                                            elevation: 0,
                                          ),
                                          onPressed: () => {
                                            Get.back(),
                                            Get.dialog(
                                              const PasswordResetModal(),
                                              barrierDismissible: true,
                                            ),
                                          },
                                          child: const Text(
                                            "Forgot Password?",
                                            style: TextStyle(
                                              fontFamily:
                                                  Assets.fontsMontserratBlack,
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  11, 56, 136, 1),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
