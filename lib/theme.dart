import 'package:el_saha/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData themeData(){
  return ThemeData(
    primaryColor: mainColor,
    accentColor: mainColor,
    fontFamily: "Almarai",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    scaffoldBackgroundColor: bgColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme(){
  return AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    textTheme: ThemeData.light().textTheme.copyWith(
      headline: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          fontFamily: "Almarai"),
    ),
  );
}

TextTheme textTheme(){
  return  ThemeData.light().textTheme.copyWith(
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
  );
}