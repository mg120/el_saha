import 'package:el_saha/models/home_view_model.dart';
import 'package:el_saha/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeViewController extends GetxController{

  int _selectedHeaderIndex = 0;
  int get selectedHeaderIndex => _selectedHeaderIndex;

  List<Categories> _categoriesList = [];
  List<Categories> get categories => _categoriesList;

  List<Banners> _banner = [];
  List<Banners> get banner => _banner;

  List<AdData> _adList = [];
  List<AdData> get adList => _adList;

  bool _loading = true;
  bool get loading => _loading;

  // update selected index
  void updateSelectedIndex(int index) async{
    _selectedHeaderIndex = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("on init called");
    getCategories();
    getLatestAds();
    super.onInit();
  }

  Future getCategories() async{
    print("get Categories started..");
    try {
      http.Response response = await http.get(MainCategories_URL,);
      print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = convert.jsonDecode(response.body);
          HomeViewModel homeDataModel = HomeViewModel.fromJson(data);
          _categoriesList = homeDataModel.categories;
          _banner = homeDataModel.banners;
          _adList = homeDataModel.ads.data;
          print("banners: ${_banner.length}");
          _loading = false;
          update();
          print("banners: $_loading");
        // //assuming this json returns an array of category response objects
        //   final List parsedList = convert.jsonDecode(response.body);
        //   _categoriesList = parsedList.map((val) =>  HomeViewModel.fromJson(val)).toList();
        //   print(_categoriesList.length);
          break;
        default:
          Get.snackbar("Error happened, plz try again", "",
              colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
          break;
      }
    } catch (exception) {
      print(exception.toString());
    }
  }

  Future getLatestAds() async{

  }
}