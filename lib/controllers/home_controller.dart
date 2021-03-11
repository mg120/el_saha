import 'package:el_saha/view/Home/pages/chats_view.dart';
import 'package:el_saha/view/Home/pages/home_view.dart';
import 'package:el_saha/view/Home/pages/more_view.dart';
import 'package:el_saha/view/Home/pages/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  int _currentIndex = 0;
  Widget _currentScreen = HomeView();
  final List<Widget> _children = [
    HomeView(),
    ChatsView(),
    ProfileView(),
    MoreView(),
  ];

  int get currentIndex => _currentIndex;
  List<Widget> get children => _children;

  Widget get currentScreen => _currentScreen;
  changeCurrentScreen(Widget currentScreen, int curIndex){
    _currentScreen = currentScreen;
    _currentIndex = curIndex;
    update();
  }
}