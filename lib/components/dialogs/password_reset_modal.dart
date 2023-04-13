import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/assets.dart';
import '../../state/controllers/loading_controller.dart';
import '../../state/controllers/password_reset_controller.dart';

class PasswordResetModal extends StatefulWidget {
  const PasswordResetModal({Key? key}) : super(key: key);

  @override
  State<PasswordResetModal> createState() => _PasswordResetModal();
}

class _PasswordResetModal extends State<PasswordResetModal> {
  final LoadingController loadingController = Get.find();

  final formKey = GlobalKey<FormState>();
  late String email;
  bool sentEmail = false;
  bool errorSentEmail = false;
  bool passwordResetWithoutEmail = false;

  @override
  void initState() {
    super.initState();
    email = '';
  }

  void startPasswordReset() async {
    if (email == '') {
      setState(() {
        passwordResetWithoutEmail = true;
      });
    } else {
      setState(() {
        passwordResetWithoutEmail = false;
      });
      var controller = PasswordResetController();
      int res = await controller.forgotPassword(email);
      if (res == 201) {
        showResetPasswordSuccess();
      } else {
        showResetPasswordError();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
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
            child: SafeArea(
              child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (loadingController.isLoading.value)
                            ? Lottie.asset(Assets.lottiesBreathingLungs,
                                width: 80,
                                height: 80,
                                repeat: true,
                                animate: true)
                            : Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              15, 20, 15, 0),
                                      child: TextField(
                                        style: const TextStyle(
                                          fontFamily:
                                              Assets.fontsMontserratBlack,
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
                                          setState(() {
                                            email = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 30, 20, 20),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                              elevation: 15,
                                            ),
                                            onPressed: () async {
                                              startPasswordReset();
                                            },
                                            child: const Text(
                                              'Submit',
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
                                    if (sentEmail)
                                      const Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 12),
                                          child: Text(
                                            'Email Sent!',
                                            style: TextStyle(
                                              fontFamily:
                                              Assets.fontsMontserratBlack,
                                              fontSize: 14,
                                              color: Color(0xFFE5E5E5),
                                              decoration:
                                              TextDecoration.underline,
                                            ),
                                          ))
                                    else if (errorSentEmail)
                                      const Padding(
                                          padding: EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 12),
                                          child: Text(
                                            "Error encountered, please try again",
                                            style: TextStyle(
                                              fontFamily: Assets
                                                  .fontsMontserratBlack,
                                              fontSize: 14,
                                              color: Colors.red,
                                              decoration: TextDecoration
                                                  .underline,
                                            ),
                                          ))
                                    else if (passwordResetWithoutEmail)
                                        const Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 12),
                                            child: Text(
                                              "Please enter your password",
                                              style: TextStyle(
                                                fontFamily: Assets
                                                    .fontsMontserratBlack,
                                                fontSize: 14,
                                                color: Colors.red,
                                                decoration: TextDecoration
                                                    .underline,
                                              ),
                                            ))
                                    else const SizedBox()
                                  ],
                                ),
                              ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void showResetPasswordSuccess() {
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
                    "Password reset email successfully sent! Please check your inbox.",
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
      const Duration(seconds: 2),
          () {
        Get.back();
      },
    );
  }

  void showResetPasswordError() {
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
                    "Unable to send password reset email. Please try again.",
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
      const Duration(seconds: 2),
          () {
        Get.back();
      },
    );
  }
}
