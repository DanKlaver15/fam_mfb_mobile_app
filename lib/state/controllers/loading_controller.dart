import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;

  void startLoader() {
    isLoading.value = true;
  }

  void endLoader() {
    isLoading.value = false;
  }
}