import 'package:el_saha/controllers/home_view_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/widgets/category_item_widget.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:el_saha/widgets/home_ad_widget.dart';
import 'package:el_saha/widgets/home_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return GetBuilder<HomeViewController>(
        init: Get.find(),
    builder:(controller)=>Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   title: Image.asset("assets/images/logo.png"),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      // ),
      body: controller.loading? Center(child: CircularProgressIndicator(),):Container(child: SingleChildScrollView(child: Column(
            children: [
              Container(
                // padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 220,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/background_graphics.png",
                      fit: BoxFit.fill,
                      width: size.width,
                      height: 200,
                    ),
                    Align(alignment: Alignment.topCenter, child: Container(padding: const EdgeInsets.only(top: 25), child: Image.asset("assets/images/logo.png")),),
                    Positioned(
                      bottom: 76,
                      left: 20,
                      right: 20,
                      child: Container(
                        // margin: const EdgeInsets.only(left: 12, right: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "انا ابحث عن...",
                              hintStyle: theme.textTheme.bodyText1
                                  .copyWith(color: Colors.black),
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                          Expanded(child: HomeTabWidget(title: "الإعلانات", index: 0,)),
                            _sizedBox(width: 6.0),
                         Expanded(child: HomeTabWidget(title: "المتاجر", index: 1,)),
                            _sizedBox(width: 6.0),
                         Expanded(child: HomeTabWidget(title: "الشركات", index: 2,))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Column(
                 // mainAxisSize: MainAxisSize.min,
                 children: [
                   CustomText(title: ". اعلان خارجى .", fontSize: 18, alignment: Alignment.center,),
                   _sizedBox(height: 6.0),
                   Container(
                     width: double.infinity,
                     child: ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(16.0)),
                       child: Image.network(controller.banner[0].photo , height: 200, fit: BoxFit.fill,),
                     ),
                   ),
                   _sizedBox(height: 16.0),
                   CustomText(title: ". أقسام الإعلانات .", fontSize: 18, alignment: Alignment.center,),
                  GridView.builder(
                       padding: const EdgeInsets.symmetric(vertical: 10),
                       shrinkWrap: true,
                       itemCount: controller.categories.length,
                       physics: NeverScrollableScrollPhysics(),
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16),
                       itemBuilder: (BuildContext context, int index) {
                         return CategoryItem(categoryModel: controller.categories[index],);
                       },
                     ),
                   _sizedBox(height: 16.0),
                   CustomText(title: ". اعلان خارجى .", fontSize: 18, alignment: Alignment.center,),
                     ListView.builder(
                       padding: const EdgeInsets.only(bottom: 60),
                     shrinkWrap: true,
                     itemCount: controller.categories.length,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (BuildContext context, int index) {
                       return HomeAdWidget(adData: controller.adList[index],);
                     },
                   ),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget _sizedBox({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
