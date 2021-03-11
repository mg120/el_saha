import 'package:el_saha/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{

  PageController _pageController;
  PageController get pageController => this._pageController;

  final int _numPages = 3;
  int get numPages => _numPages;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  // return list of indicators
  List<Widget> get buildPageIndicator=> _buildPageIndicator();

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 26.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? mainColor : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  void updateNumPage(int index) {
    _currentPage = index;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    _pageController = PageController(initialPage: 0);
    print("in on init");
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _pageController.dispose();
    super.onClose();
  }
}