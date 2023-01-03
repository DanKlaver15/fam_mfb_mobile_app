import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../state/controllers/home_page_controller.dart';
import '../../state/controllers/loading_controller.dart';
import '../custom_appbar.dart';

class HomePageWidget extends StatelessWidget {
  HomePageWidget({Key? key}) : super(key: key);

  final loadingController = Get.put(LoadingController(), permanent: true);
  final homePageController = Get.put(HomePageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    homePageController.userPreviouslyLoggedIn();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          elevation: 30,
        ),
      ),
      body: GetBuilder<HomePageController>(
        builder: (HomePageController controller) {
          return Center(
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
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 18, 20, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 18, 12, 12),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 15,
                                  backgroundColor:
                                  const Color.fromRGBO(50, 130, 184, 1),
                                  minimumSize: const Size(0, 40),
                                ),
                                onPressed: homePageController.showRegistrationModal,
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontFamily: Assets.fontsMontserratBlack,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  70, 12, 70, 12),
                              child: Row(children: <Widget>[
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Transform.translate(
                                        offset: const Offset(0, 2),
                                        child: const Icon(
                                          Icons.keyboard_arrow_up,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(0, -2),
                                        child: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  elevation: 15,
                                  minimumSize: const Size(0, 40),
                                ),
                                onPressed: homePageController.showLoginModal,
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontFamily: Assets.fontsMontserratBlack,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
