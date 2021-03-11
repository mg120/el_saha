import 'dart:async';

import 'package:el_saha/view/Auth/login_screen.dart';
import 'package:el_saha/view/Home/home_screen.dart';
import 'package:el_saha/view/onBoarding/onboard_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() async {
    Timer(Duration(seconds: 4), () {
      Get.off(() => OnBoardingScreen());
    });
  }
}
