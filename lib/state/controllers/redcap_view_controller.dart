import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:app/pages/onboarding/onboarding_page.dart';
import 'package:app/state/controllers/loading_controller.dart';

final loadingController = Get.find<LoadingController>();

redCapController(String userId) => WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        if (request.url == 'http://google.com?close_browser=1' || request.url == 'https://www.google.com/?close_browser=1') {
          loadingController.startLoader();
          Get.offAll(() => const OnboardingPage());
          loadingController.endLoader();
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://redcap.mcw.edu/surveys/?s=FTDNM8JEF9NE4EA9&app_id=$userId&pref_language=en'));
