import 'package:el_saha/helper/binding.dart';
import 'package:el_saha/theme.dart';
import 'package:el_saha/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      initialBinding: Binding(),
      home: SplashScreen(),
    );
  }
}
