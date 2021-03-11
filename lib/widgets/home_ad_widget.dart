import 'package:el_saha/models/home_view_model.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAdWidget extends StatelessWidget {
  final AdData adData;

  const HomeAdWidget({Key key, this.adData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft:  Radius.circular(10.0)),
                    child: Image.network(adData.photo.photo, fit: BoxFit.fill,),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      CustomText(title: adData.title, color: blackColor, fontSize: 18, alignment: Alignment.topRight,),
                      _sizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            child: Image.network(adData.getUser.photo, width: 24, height: 24, fit: BoxFit.fill,),),
                          _sizedBox(width: 8),
                          Expanded(child: CustomText(title: adData.getUser.username, fontSize: 15, alignment: Alignment.topRight,)),
                          _bottomRow(iconUrl: "assets/images/likes.png", text: "${adData.likesCount}"),
                          _sizedBox(width: 16),
                          _bottomRow(iconUrl: "assets/images/views.png", text: "${adData.commentsCount}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            adData.isAdv?Positioned(
              top: 0,
              right: 0,
              child: ClipRRect(
                child: Image.asset("assets/images/premium_badge.png", width: 36, height: 36,),
              ),
            ):SizedBox(),
            Positioned(
              top: 10,
              left: 12,
              child: _containerText(title: adData.createdAt, bgColor: Colors.black26),
            ),
            Positioned(
              top: 140,
              left: 12,
              child: _containerText(title: "${adData.price} SR", bgColor: mainColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomRow({String iconUrl, String text}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(title: text, color: blackColor, fontSize: 15, alignment: Alignment.center,),
        _sizedBox(width: 4),
        Image.asset(iconUrl, width: 16, height: 16,),
      ],
    );
  }

  Widget _containerText({Color bgColor, String title}){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: CustomText(title: title, color: whiteColor, fontSize: 14, alignment: Alignment.center,),
    );
  }

  Widget _sizedBox({double width, double height}){
    return SizedBox(width: width, height: height,);
  }
}
