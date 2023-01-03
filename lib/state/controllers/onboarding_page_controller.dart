import 'package:get/get.dart';

import '../../models/user.dart';
import './hive_controller.dart';

class OnboardingPageController extends GetxController {
  var needsOnboarding = false.obs;
  var userType = 1.obs;
  var dotsCount = 17.obs;
  var page = 0.obs;
  var isSelected = false.obs;
}