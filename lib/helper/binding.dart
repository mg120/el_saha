
import 'package:el_saha/controllers/auth_view_controller.dart';
import 'package:el_saha/controllers/home_controller.dart';
import 'package:el_saha/controllers/home_view_controller.dart';
import 'package:el_saha/controllers/login_view_controller.dart';
import 'package:el_saha/controllers/onboarding_controller.dart';
import 'package:el_saha/controllers/splash_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LoginControlView());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => OnBoardingController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeViewController());
  }
}