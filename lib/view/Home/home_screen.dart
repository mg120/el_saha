import 'package:el_saha/controllers/home_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/view/Home/pages/chats_view.dart';
import 'package:el_saha/view/Home/pages/home_view.dart';
import 'package:el_saha/view/Home/pages/more_view.dart';
import 'package:el_saha/view/Home/pages/profile_view.dart';
import 'package:el_saha/widgets/bottom_bar_item.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black26),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<HomeController>(
        init: Get.find(),
        builder:(controller)=> Scaffold(
          backgroundColor: Color(0xFFF5FCFF),
          body: controller.children[controller.currentIndex],
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFFFFC117),
            child: Image.asset("assets/images/add.png", width: 28, height: 28,),
            onPressed: () {
              print("add btn clicked..");
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: CircularNotchedRectangle(),
            notchMargin: 12,
            child: Container(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BottomBarItem(title: "الرئيسية", image: "assets/images/nav_home.png", onPressed: () {
                        controller.changeCurrentScreen(HomeView(), 0);
                      }, index: 0,),
                      BottomBarItem(title: "الرسائل", image: "assets/images/nav_notifications.png", onPressed: () {
                        controller.changeCurrentScreen(ChatsView(), 1);
                      },index: 1,),
                    ],
                  ),

                  // Right Tab bar icons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      BottomBarItem(title: "الحساب", image: "assets/images/nav_account.png", onPressed: () {
                        controller.changeCurrentScreen(ProfileView(), 2);
                      },index: 2,),
                      BottomBarItem(title: "المزيد", image: "assets/images/more.png", onPressed: () {
                        controller.changeCurrentScreen(MoreView(), 3);
                      },index: 3,),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
