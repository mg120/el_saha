import 'dart:io';

import 'package:el_saha/controllers/auth_view_controller.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/widgets/custom_button.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:timer_button/timer_button.dart';

class VerifyAccount extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String email;

  VerifyAccount({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontFamily: 'Almarai', fontSize: 16.0);
    final theme =Theme.of(context);

    final resendCodeButton = TimerButton(
      label: "إعادة ارسال الكود",
      timeOutInSeconds: 60,
      onPressed: () {
        // _resendCode();
      },
      disabledColor: Colors.grey,
      color: mainColor,
      buttonType: ButtonType.OutlineButton,
      disabledTextStyle: theme.textTheme.button.copyWith(color: blackColor, fontWeight: FontWeight.w400),
      activeTextStyle: theme.textTheme.button.copyWith(fontWeight: FontWeight.w600),
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AuthViewModel>(
        builder:(controller)=> Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            title: Text("تفعيل الحساب", style: theme.textTheme.title.copyWith(fontSize: 20),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body:  ModalProgressHUD(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: "ادخل الكود المكون من 6 ارقام الذي تم ارساله لرقم الجوال",
                          fontSize: 17,
                          alignment: Alignment.topRight,
                        ),
                        _sizedBox(width: 0, height: 36),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinEntryTextField(
                            fields: 6,
                            showFieldAsBox: true,
                            onSubmit: (text) {
                              print(text);
                              controller.enteredCode = text;
                            },
                          ),
                        ),
                        _sizedBox(width: 0, height: 36.0),
                        Container(
                          width: 250,
                          height: 45,
                          child: CustomRaisedButton(
                            title: "ارسال",
                            function:(){
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                // No any error in validation
                                controller.checkCode(email);
                              }
                            } ,
                          ),
                        ),
                        _sizedBox(width: 0, height: 20.0),
                        resendCodeButton,
                        _sizedBox(width: 0, height: 16.0),
                      ],
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

  Widget _sizedBox({double width, double height}){
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
