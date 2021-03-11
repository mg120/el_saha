import 'dart:math';

import 'package:el_saha/models/state_model.dart';
import 'package:el_saha/utils/constants.dart';
import 'package:el_saha/view/Auth/verify_account.dart';
import 'package:el_saha/view/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AuthViewModel extends GetxController {
  String  userName, email, password, phone, enteredCode;

  StateModel _selectedState;
  StateModel get selectedState=>_selectedState;

  List<StateModel> _listCities =[];
  List<StateModel> get listCities => _listCities;

  // Initially password is obscure
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  // Initially password is obscure
  bool _progressLoading = false;
  bool get progressLoading => _progressLoading;

  void updateObscureText() {
    _obscureText = !_obscureText;
    update();
  }

  void updateProgressLoading(bool loading) {
    _progressLoading = loading;
    update();
  }

  void updateSelectedState(StateModel state) {
    _selectedState = state;
    update();
  }

  void signIn() async {
    updateProgressLoading(true);
    print("_progressLoading: $_progressLoading");
    print("email: $email");
    print("password: $password");
    Map<String, String> header = {"Accept-Language": "en"};
    Map<String, String> body = {
      "email": email,
      "password": password,
      "device_token": ""
    };
    try {
      http.Response response = await http.post(LOGIN_URL, headers: header, body: body);
      print(response.body);
      updateProgressLoading(false);
      switch (response.statusCode) {
        case 200:
          Get.snackbar("Login Success", "you logged successfully",
              colorText: Colors.green, snackPosition: SnackPosition.BOTTOM);
          goHome();
          break;
        default:
          Get.snackbar("خطأ رقم الجوال او كلمة المرور", "تحقق من رقم الجوال او كلمة المرور الخاص بك",
              colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
          break;
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error Login Account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccount() async {
    updateProgressLoading(true);
    print("userName: $userName");
    print("phone: $phone");
    print("email: ${_selectedState.id}");
    print("email: $email");
    Map<String, String> header = {"Accept-Language": "en"};
    Map<String, String> body = {
      "username": userName,
      "email": email,
      "phone": phone,
      "state_id": "${_selectedState.id}",
      "password": password,
      "password_confirmation": password,
      "device_token": "123"
    };
    try {
      http.Response response = await http.post(REGISTER_URL, body: body);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      updateProgressLoading(false);
      switch (response.statusCode) {
        case 200:
          Get.snackbar("تم الدخول بنجاح", "تم الدخول بنجاح",
              colorText: Colors.green, snackPosition: SnackPosition.BOTTOM);
          Get.off(()=>VerifyAccount(email: email));
          break;
        default:
          Get.snackbar(data['message'], "",
              colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
          break;
      }
    } catch (exception) {
      print(exception.toString());
    }
  }

  // get States, cities
  void getCities()async{
    try {
      http.Response response = await http.get(Cities_URL,);
      print(response.body);
      switch (response.statusCode) {
        case 200:
        //assuming this json returns an array of signupresponse objects
          final List parsedList = convert.jsonDecode(response.body);
          _listCities = parsedList.map((val) =>  StateModel.fromJson(val)).toList();
          break;
        default:
          Get.snackbar("خطأ رقم الجوال او كلمة المرور", "تحقق من رقم الجوال او كلمة المرور الخاص بك",
              colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
          break;
      }
    } catch (e) {
      print(e.message);
      Get.snackbar("Error Login Account", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void checkCode(String email) async {
    print("code: $enteredCode");
    updateProgressLoading(true);
    Map<String, String> header = {"Accept-Language": "en"};
    Map<String, String> body = {
      "email": email,
      "activation_code": enteredCode,
      "device_token": ""
    };
    try {
      http.Response response = await http.post(Activate_URL, headers: header, body: body);
      print(response.body);
      updateProgressLoading(false);
      switch (response.statusCode) {
        case 200:
          Get.snackbar("Login Success", "you logged successfully",
              colorText: Colors.green, snackPosition: SnackPosition.BOTTOM);
          goHome();
          break;
        default:
          Get.snackbar("خطأ رقم الجوال او كلمة المرور", "تحقق من رقم الجوال او كلمة المرور الخاص بك",
              colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
          break;
      }
    } catch (e) {
      print(e.message);
      Get.snackbar("Error Login Account", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    getCities(); // get states first
    super.onInit();
    // _user.bindStream(_auth.authStateChanges());
  }

  void goHome() {
    Get.offAll(() => HomeScreen());
  }
}
