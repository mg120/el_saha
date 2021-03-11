import 'package:el_saha/controllers/onboarding_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OnBoardingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ThemeData theme = Theme.of(context);
    return GetBuilder<OnBoardingController>(
      builder:(controller)=> Container(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: FlatButton(
                  //     onPressed: () => Get.off(() => LoginScreen()),
                  //     child: Text(
                  //       'تخطى',
                  //       style:
                  //       theme.textTheme.title.copyWith(color: Colors.green),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: height * 0.7,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: controller.pageController,
                      onPageChanged: (int page) {
                        controller.updateNumPage(page);
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Stack(
                              //   children: <Widget>[
                              //
                              //     Align(
                              //       alignment: Alignment.topCenter,
                              //       child: Image.asset(
                              //         "assets/images/ads1.png",
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              Container(
                                width: double.infinity,
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/slide_img_1.png',
                                  ),
                                  height: height * 0.28,
                                  width: width,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Text(
                                'مرحباً بكم في الساحة',
                                style: theme.textTheme.title
                                    .copyWith(color: whiteColor),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Center(
                                child: Text(
                                  'الساحة عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة او الجديدة',
                                  style: theme.textTheme.subtitle.copyWith(color: whiteColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(26.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/back_ads.png',
                                  ),
                                  height: height * 0.28,
                                  width: width,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Text(
                                'مرحباً بكم في الساحة',
                                style: theme.textTheme.title
                                    .copyWith(color: theme.primaryColor),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Center(
                                child: Text(
                                  'الساحة عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة او الجديدة',
                                  style: theme.textTheme.subtitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(26.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/back_ads.png',
                                      ),
                                      height: height * 0.28,
                                      width: width,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      'assets/images/buy_sell.png',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Text(
                                'مرحباً بكم في الساحة',
                                style: theme.textTheme.title
                                    .copyWith(color: theme.primaryColor),
                              ),
                              SizedBox(
                                height: height * 0.03,
                              ),
                              Center(
                                child: Text(
                                  'الساحة عبارة عن منصة تطبيق الكترونى للجوالات لعرض إعلانات المستخدمين للسلع المستعملة او الجديدة',
                                  style: theme.textTheme.subtitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.buildPageIndicator,
                  ),
                  controller.currentPage != controller.numPages - 1
                      ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: FlatButton(
                        onPressed: () {
                          controller.pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: ButtonTheme(
                          minWidth: double.infinity - 50,
                          height: 40,
                          child: FlatButton(
                            color: Colors.white,
                            padding:
                            EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                            onPressed: () {
                              controller.updateNumPage(controller.currentPage + 1);
                              controller.pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Text(
                              "التالى",
                              style: theme.textTheme.subtitle,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Colors.green, width: 1.2)),
                          ),
                        ),
                      ),
                    ),
                  )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
