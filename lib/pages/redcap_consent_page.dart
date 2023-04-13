import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../state/controllers/loading_controller.dart';
import '../../state/controllers/redcap_view_controller.dart';
import 'package:app/components/web_view_nav_controls.dart';

class RedcapConsentPage extends StatefulWidget {
  const RedcapConsentPage({Key? key, required this.userId}) : super(key: key);

  final String userId;
  @override
  State<RedcapConsentPage> createState() => _RedcapConsentPage();
}

class _RedcapConsentPage extends State<RedcapConsentPage> {
  late final WebViewController controller;
  final loadingController = Get.put(LoadingController());

  @override
  void initState() {
    super.initState();
    controller = redCapController(widget.userId);
  }

  @override
  void dispose() {
    super.dispose();
    loadingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loadingController.isLoading.value) {
      return Scaffold(
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: Lottie.asset(Assets.lottiesBreathingLungs, width: 80, height: 80, repeat: true, animate: true),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            color: const Color.fromRGBO(187, 225, 250, 1.0),
            onPressed: () async {
              if (await controller.canGoBack()) {
                await controller.goBack();
              } else {
                Get.back();
              }
            },
          ),
          backgroundColor: const Color.fromRGBO(15, 76, 117, 1.0),
          actions: <Widget>[
            NavigationControls(controller: controller),
          ],
          elevation: 15,
          //actions: [NavigationControls(controller: controller)],
        ),
        body: WebViewWidget(
          controller: controller,
        ),
        //TODO: Add Flurry endTimedEvent()
      );
    }
  }
}
