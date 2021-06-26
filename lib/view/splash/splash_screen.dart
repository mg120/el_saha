import 'package:el_saha/controllers/splash_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return GetBuilder<SplashController>(
        init: SplashController(),
        builder:(controller)=> Scaffold(
          backgroundColor: splashBgColor,
          body: Center(
            child: Container(
              child: Image.asset("assets/images/logo_white.png" , fit: BoxFit.contain,),
            ),
          ),
        ),
      );
  }
}
