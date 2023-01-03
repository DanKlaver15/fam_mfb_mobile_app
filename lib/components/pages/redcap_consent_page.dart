import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../state/controllers/redcap_view_controller.dart';
import './onboarding_page.dart';

class RedcapConsentPage extends StatelessWidget {
  RedcapConsentPage({Key? key, required this.userId}) : super(key: key);

  final String userId;
  late final RedCapViewController controller = RedCapViewController(userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Text(
              'Please complete the consent form',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          elevation: 15,
          leadingWidth: Get.width * 0.2,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(15, 76, 117, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => OnboardingPage());
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: WebViewWidget(controller: controller));
  }
}
