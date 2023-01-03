import 'dart:async';

import 'package:app/components/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../components/dialogs/add_user_result.dart';
import 'loading_controller.dart';
import 'services/registration_service_controller.dart';

class RegistrationController extends GetxController {
  LoadingController loadingController = Get.find();

  final email = ''.obs;
  final password = ''.obs;
  final acceptedTerms = false.obs;
  final submitWithoutTerms = false.obs;
  final userType = 1.obs;
  final counter = 0.obs;

  final List<Map> userTypes = [
    {"value": 1, "text": 'Facility/Center'},
    {"value": 2, "text": 'Parent of a child with Asthma'},
    {"value": 3, "text": 'General'},
  ];

  void onChangedCheckbox(value) {
    if (counter.value > 0) {
      submitWithoutTerms.value = false;
    }
    acceptedTerms.value = value!;
  }

  void showAddUserResponse(int statusCode) async {
    Get.dialog(AddUserResultModal(statusCode: statusCode));
    Future<void>.delayed(
      const Duration(seconds: 2),
          () {
        Get.to(() => HomePageWidget());
      },
    );
    // Timer? timer = Timer(const Duration(milliseconds: 2000), () {
    //   Get.to(() => HomePageWidget());
    // });
    // Get.dialog(AddUserResultModal(
    //   statusCode: statusCode,
    // )).then((value) {
    //   // dispose the timer in case something else has triggered the dismiss.
    //   timer?.cancel();
    //   timer = null;
    // });
    // timer?.cancel();
    // timer = null;
  }

  void registerUser() async {
    if (!acceptedTerms.value) {
      submitWithoutTerms.value = true;
      counter.value++;
    } else {
      submitWithoutTerms.value = false;
      counter.value = 0;
    }
    if (!submitWithoutTerms.value) {
      loadingController.startLoader();
      counter.value++;

      Tuple2<String?, int> response =
          await addUser(email.value, password.value, userType.value);
      if (response.item2 == 201) {
        await sendEmailVerification(email.value);
      }

      acceptedTerms.value = false;
      submitWithoutTerms.value = false;
      loadingController.endLoader();

      showAddUserResponse(response.item2);
    }
  }
}
