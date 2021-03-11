import 'package:el_saha/helper/binding.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/view/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: bgColor, // status bar color
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Almarai",
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: "Almarai"),
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: "Almarai"),
          subtitle: TextStyle(fontSize: 15, fontFamily: "Almarai", fontWeight: FontWeight.w700,),
          body1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: "Almarai"),
          body2: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: "Almarai"),
          button: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: "Almarai"),
        ),
      ),
      initialBinding: Binding(),
      home: SplashScreen(),
    );
  }
}
