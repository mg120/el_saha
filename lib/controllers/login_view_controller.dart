import 'package:el_saha/view/Auth/login_screen.dart';
import 'package:el_saha/view/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_view_controller.dart';

class LoginControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // return (Get
      //     .find<AuthViewModel>().user != null) ? HomeScreen() : LoginScreen();
    });
  }
}
