import 'package:el_saha/controllers/auth_view_controller.dart';
import 'package:el_saha/models/state_model.dart';
import 'package:el_saha/utils/colors.dart';
import 'package:el_saha/widgets/custom_button.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:el_saha/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Almarai', fontSize: 16.0);
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AuthViewModel>(
        init: AuthViewModel(),
        builder:(controller)=> Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: mainColor, //change your color here
            ),
            title: Text("تسجيل حساب جديد", style: theme.textTheme.title.copyWith(fontSize: 20),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body:  Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        title: "اشترك الآن مع تطبيق الساحة",
                        fontSize: 17,
                        alignment: Alignment.topRight,
                      ),
                      _sizedBox(width: 0, height: 36.0),
                      CustomTextFormField(
                          obscureText: false,
                          onSave: (value){
                            controller.userName = value;
                          },
                          emptyText: "الاسم مطلوب",
                          keyboardType: TextInputType.text,
                          style: style,
                          labelText: "الأسم",
                          maxLines: 1,
                          prefixIcon: "assets/images/user.png",
                          enabled: true),
                      _sizedBox(width: 0, height: 12),
                      CustomTextFormField(
                          obscureText: false,
                          onSave: (value){
                            controller.phone = value;
                          },
                          emptyText: "رقم الجوال مطلوب",
                          keyboardType: TextInputType.phone,
                          style: style,
                          labelText: "رقم الجوال",
                          maxLines: 1,
                          prefixIcon: "assets/images/phone.png",
                          enabled: true),
                      _sizedBox(width: 0, height: 12),
                      CustomTextFormField(
                          obscureText: false,
                          onSave: (value){
                            controller.email = value;
                          },
                          emptyText: "الايميل مطلوب",
                          keyboardType: TextInputType.emailAddress,
                          style: style,
                          labelText: "الإيميل",
                          maxLines: 1,
                          prefixIcon: "assets/images/email.png",
                          enabled: true),
                      _sizedBox(width: 0, height: 12),
                      //======================================================== State
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/city.png", width: 24, height: 24,),
                            Expanded(
                              child:  DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<StateModel>(
                                      isExpanded: true,
                                      value: controller.selectedState,
                                      iconSize: 30,
                                      icon: (null),
                                      style: theme.textTheme.body1.copyWith(color: Colors.grey, fontSize: 15),
                                      hint: Text('اختر المدينة'),
                                      onChanged: (StateModel newValue) {
                                        print(newValue.id);
                                        print(newValue.name);
                                        controller.updateSelectedState(newValue);
                                      },
                                      items: controller.listCities?.map((item) {
                                        return  new DropdownMenuItem(
                                            child: new Text(item.name),
                                            value: item,
                                        );
                                      })?.toList() ??
                                          [],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      _sizedBox(height: 12, width: 0),
                      CustomTextFormField(
                          obscureText: controller.obscureText,
                          onSave: (value){
                            controller.password = value;
                          },
                          emptyText: "كلمة المرور مطلوبة",
                          keyboardType: TextInputType.visiblePassword,
                          style: style,
                          labelText: "كلمة المرور",
                          maxLines: 1,
                          prefixIcon: "assets/images/password.png",
                          suffixIcon: new GestureDetector(
                            onTap: () {
                              print("clicked icon");
                              controller.updateObscureText();
                              print("${controller.obscureText}");
                            },
                            child:
                            new Icon(controller.obscureText ? Icons.visibility : Icons.visibility_off, color: mainColor),
                          ),
                          enabled: true),
                      _sizedBox(width: 0, height: 28.0),
                     Container(
                       width: 200,
                       height: 45,
                       child: CustomRaisedButton(
                         title: "تسجيل",
                         function:(){
                           if (_formKey.currentState.validate()) {
                             _formKey.currentState.save();
                             // check if state selected or not
                             if (controller.selectedState == null) {
                               Get.snackbar("اختر المدينة اولا", "يجب اختيار المدينة اولا", colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
                               return;
                             }
                             // No any error in validation
                             controller.createAccount();
                           }
                         } ,
                       ),
                     ),
                      _sizedBox(width: 0, height: 36.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(title: "بالتسجيل مع الساحة، انا أوافق على ", alignment: Alignment.topRight,),
                          InkWell(
                            // onTap: ()=> Get.to(ForgetPasswordScreen()),
                              child: CustomText(title: "الشروط والأحكام", alignment: Alignment.topRight, color: mainColor,)),
                        ],
                      ),
                    ],
                  ),
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
