import 'package:el_saha/controllers/home_view_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class HomeTabWidget extends StatelessWidget {
  final String title;
  final int index;

  const HomeTabWidget({this.title, this.index});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      builder:(controller)=> InkWell(
        onTap: ()=> controller.updateSelectedIndex(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color:  controller.selectedHeaderIndex == index?Color(0xFF00AEEF): whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: CustomText(title: title, alignment: Alignment.center, maxLines: 1, color: blackColor, ),
        ),
      ),
    );
  }
}
