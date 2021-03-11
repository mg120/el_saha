import 'package:el_saha/controllers/home_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/view/Home/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

class BottomBarItem extends StatelessWidget {
  final String title;
  final String image;
  final int index;
  final Function onPressed;

  const BottomBarItem({this.title, this.image, this.index, this.onPressed});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(
      builder:(controller)=>  Container(
        width: width/5 +2,
        decoration: BoxDecoration(
          color: controller.currentIndex == index ? Color(0xFFB2EBF2) : Colors.transparent,
          borderRadius: BorderRadius.circular(6.0)
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image, width: 20, height: 20,),
              SizedBox(height: 5,),
              CustomText(title: title, color: blackColor, fontSize: 14, alignment: Alignment.center, ),
            ],
          ),
        ),
      ),
    );
  }
}
