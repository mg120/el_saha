import 'dart:io';

import 'package:el_saha/controllers/auth_view_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/view/Auth/sign_screen.dart';
import 'package:el_saha/widgets/custom_button.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:el_saha/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontFamily: 'Almarai', fontSize: 16.0);
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AuthViewModel>(
        builder:(controller)=> Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            title: Text("دخول", style: theme.textTheme.title.copyWith(fontSize: 20),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body:  ModalProgressHUD(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    // height: size.height,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          title: "سجل بياناتك للدخول لحسابك",
                          fontSize: 17,
                          alignment: Alignment.topRight,
                        ),
                        _sizedBox(width: 0, height: 36.0),
                        CustomTextFormField(
                            obscureText: false,
                            onSave: (value){
                              controller.email = value;
                            },
                            emptyText: "رقم الجوال مطلوب",
                            keyboardType: TextInputType.emailAddress,
                            style: style,
                            labelText: "رقم الجوال",
                            maxLines: 1,
                            prefixIcon: "assets/images/phone.png",
                            enabled: true),
                        _sizedBox(width: 0, height: 20),
                        CustomTextFormField(
                            obscureText: true,
                            onSave: (value){
                              controller.password = value;
                            },
                            emptyText: "كلمة المرور مطلوبة",
                            keyboardType: TextInputType.visiblePassword,
                            style: style,
                            labelText: "كلمة المرور",
                            maxLines: 1,
                            prefixIcon: "assets/images/password.png",
                            enabled: true),
                        _sizedBox(width: 0, height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomRaisedButton(
                              title: "دخول",
                              function:(){
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  // No any error in validation
                                  controller.signIn();
                                }
                              } ,
                            ),
                            InkWell(
                              // onTap: ()=> Get.to(ForgetPasswordScreen()),
                                child: CustomText(title: "نسيت كلمة المرور", alignment: Alignment.topRight, color: mainColor,)),
                          ],
                        ),
                        _sizedBox(width: 0, height: 36.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(title: "لست مُسجل مع الساحة؟", alignment: Alignment.topRight,),
                            InkWell(
                              onTap: ()=> Get.to(SignScreen()),
                                child: CustomText(title: " سجّل حساب جديد", alignment: Alignment.topRight, color: mainColor,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            inAsyncCall: controller.progressLoading,
            // demo of some additional parameters
            opacity: 0.5,
            progressIndicator: Platform.isAndroid
                ? Center(child: CircularProgressIndicator())
                : Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ),
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
