import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DestinationController extends GetxController{
  List<String> _destinations = [
    'Dhaka (DAC)',
    'Chittagram (CHT)',
    'Jeddah (JED)',
    'Ryad (RAD)',
    'Madina (MAD)',
    'Jeddah (JED)',
    'Ryad (RAD)',
    'Jeddah (JED)',
    'Ryad (RAD)',
  ];

  List<String> _filteredDestinations = [];
  bool _isSearching = false;

  bool get isSearching => _isSearching;
  List<String> get destinations => _destinations;
  List<String> get filteredDes => _filteredDestinations;

  @override
  void onInit() {
    _filteredDestinations = _destinations;
    print(_filteredDestinations.length);
  }

  onSearchTextChanged(String text) {
    _filteredDestinations = _destinations.where((element) => element.toLowerCase().contains(text.toLowerCase())).toList();
    print(_filteredDestinations.toString());
    update();
  }

  initDestination(){
    _filteredDestinations = _destinations;
    update();
  }

  updateSearching(bool searching){
    _isSearching = searching;
    update();
  }
}