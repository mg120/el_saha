import 'package:el_saha/models/Product.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TopDetailsContainer(),
        ],
      ),
    );
  }

  Widget TopDetailsContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomText(
              title: demoProducts[0].title,
              fontSize: 17,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 68,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: demoProducts[0].isFavourite
                    ? Color(0xFFFFE6E6)
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(15.0)),
              ),
              child: SvgPicture.asset(
                "assets/icons/heart_icon.svg",
                color: demoProducts[0].isFavourite
                    ? Color(0xFFFF4848)
                    : Colors.grey.shade300,
                height: 18,
              ),
            ),
          ),
          SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomText(
              title: demoProducts[0].description,
              color: Colors.grey,
              fontSize: 14,
              maxLines: 3,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            margin: const EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.only(topRight: Radius.circular(24.0),
                  topLeft: Radius.circular(24.0)),
            ),
            child: Column(
              children: [
                dotsColorWidget(),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    margin: const EdgeInsets.only(top: 24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24.0),
                          topLeft: Radius.circular(24.0)),
                    ),
                    child: FlatButton(
                      height: 48,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Colors.deepOrangeAccent,
                      child: Text(
                        "Add To Cart", style: TextStyle(color: Colors.white, fontSize: 19),),
                      onPressed: () {},
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dotsColorWidget() {
    // Now this is fixed and only for demo
    int selectedColor = 2;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        children: [
          ...List.generate(demoProducts[0].colors.length, (index) =>
              Container(
                padding: const EdgeInsets.all(6.0),
                // margin: const EdgeInsets.only(left: 5.0),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.deepOrangeAccent.withOpacity(
                      index == selectedColor ? 1 : 0)),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: demoProducts[0].colors[index],
                      shape: BoxShape.circle
                  ),
                ),
              )),
          Spacer(),
          Row(
            children: [
              CircleAvatar(child: Icon(Icons.add),
                radius: 18,
                backgroundColor: Colors.white,),
              SizedBox(width: 12.0,),
              CircleAvatar(child: Icon(Icons.remove),
                radius: 18,
                backgroundColor: Colors.white,),
            ],
          )
        ],
      ),
    );
  }
}
