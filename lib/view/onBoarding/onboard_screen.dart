import 'package:el_saha/controllers/onboarding_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/view/Auth/login_screen.dart';
import 'package:el_saha/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends GetWidget<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final ThemeData theme = Theme.of(context);

    final introKey = GlobalKey<IntroductionScreenState>();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.black26),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: splashBgColor,
        body:  IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              decoration: _pageDecoration(),
              title: "مرحباً بكم في الساحة",
              body: "الساحة عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة او الجديدة",
              image: _buildImage('images/slide_img_1.png', height),
              // decoration: pageDecoration,
            ),
            PageViewModel(
              decoration: _pageDecoration(),
              title: "مرحباً بكم في الساحة",
              body: "الساحة عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة او الجديدة",
              image: _buildImage('images/slide_img_2.png', height),
            ),
            PageViewModel(
              decoration: _pageDecoration(),
              title: "مرحباً بكم في الساحة",
              body: "الساحة عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة او الجديدة",
              image: _buildImage('images/slide_img_3.png', height),
            ),
          ],
          onDone: () => _onIntroEnd(),
          onSkip: () => _onIntroEnd(), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: Text('تخطى', style: theme.textTheme.button,),
          next: Icon(Icons.arrow_forward, color: whiteColor,),
          done: Text('التالى', style: theme.textTheme.button.copyWith(color: mainColor)),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: theme.accentColor,
              color: whiteColor,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)
              )
          ),
        ),
      ),
    );
  }
  Widget _buildImage(String assetName, double height) {
    return Align(
      child: Image.asset('assets/$assetName',height: 380, width:double.infinity ,fit: BoxFit.fill,),
      alignment: Alignment.topCenter,
    );
  }

  _onIntroEnd() {
    print("next Btn Clicked");
    Get.off(()=> LoginScreen());
  }

  PageDecoration _pageDecoration(){
    return PageDecoration(
      contentPadding: const EdgeInsets.only(top: 60.0),
      pageColor: Color(0xFF25364F),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Almarai"),
      bodyTextStyle: TextStyle(color: Colors.white, fontSize: 16, fontFamily: "Almarai"),
    );
  }
}
