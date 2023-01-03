import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../../state/controllers/loading_controller.dart';
import '../../state/controllers/registration_dialog_controller.dart';
import '../pdf_viewer_from_asset.dart';

class RegistrationModal extends StatefulWidget {
  const RegistrationModal({Key? key}) : super(key: key);

  @override
  State<RegistrationModal> createState() => _RegistrationModal();
}

class _RegistrationModal extends State<RegistrationModal> {
  final LoadingController loadingController = Get.find();
  final RegistrationController registrationController =
      Get.put(RegistrationController(), permanent: false);

  final formKey = GlobalKey<FormState>();
  final checkBoxKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            color: const Color.fromRGBO(27, 38, 44, 1).withOpacity(0.7),
            margin: EdgeInsets.fromLTRB(
                20, 0, 20, MediaQuery.of(context).viewInsets.bottom),
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        registrationController.email.value =
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
                                        registrationController.password.value =
                                            value;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 10),
                                    child: DropdownButton(
                                      value:
                                          registrationController.userType.value,
                                      dropdownColor:
                                          const Color.fromRGBO(15, 76, 117, 1),
                                      style: const TextStyle(
                                          color: Color(0xFFE5E5E5)),
                                      underline: Container(
                                        height: 2,
                                        color: const Color.fromRGBO(
                                            15, 76, 117, 1),
                                      ),
                                      isExpanded: true,
                                      items: registrationController.userTypes
                                          .map((item) => DropdownMenuItem(
                                                value: item["value"],
                                                child: Text(item["text"]),
                                              ))
                                          .toList(),
                                      onChanged: (value) => setState(
                                        () {
                                          registrationController
                                              .userType.value = value as int;
                                        },
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => Checkbox(
                                          key: checkBoxKey,
                                          value: registrationController
                                              .acceptedTerms.value,
                                          side: const BorderSide(
                                              color: Color(0xFF9F9F9F)),
                                          onChanged: (value) {
                                            registrationController
                                                .onChangedCheckbox(value!);
                                          },
                                        ),
                                      ),
                                      RichText(
                                        textScaleFactor: 0.9,
                                        text: TextSpan(
                                          text: 'I agree to the ',
                                          style: const TextStyle(
                                            color: Color(0xFFE5E5E5),
                                            fontFamily:
                                                Assets.fontsMontserratBlack,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Terms of Service',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontFamily:
                                                    Assets.fontsMontserratBlack,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PDFViewerFromAsset(
                                                              pdfAssetPath:
                                                                  Assets
                                                                      .pdfsEula),
                                                    ),
                                                  );
                                                },
                                            ),
                                            const TextSpan(
                                              text: ' and ',
                                              style: TextStyle(
                                                color: Color(0xFFE5E5E5),
                                                fontFamily:
                                                    Assets.fontsMontserratBlack,
                                              ),
                                            ),
                                            //TODO: add privacy policy
                                            const TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontFamily:
                                                    Assets.fontsMontserratBlack,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, 0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(20, 15, 20, 20),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            elevation: 15,
                                          ),
                                          onPressed: () async {
                                            registrationController
                                                .registerUser();
                                          },
                                          child: const Text(
                                            'Register',
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
                                ],
                              ),
                            ),
                      Obx(
                        () => (registrationController.submitWithoutTerms.value)
                            ? const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: Text(
                                  'Please accept the Terms of Service and Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: Assets.fontsMontserratBlack,
                                  ),
                                ))
                            : const SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
