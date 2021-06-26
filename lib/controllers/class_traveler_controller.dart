import 'package:get/get.dart';

class ClassTravelerController extends GetxController{
  String _classes = "Economy";
  int numTravelers = 0;

  Map<String, int> travelers = {
    'adults': 0,
    'senior': 0,
    'youth': 0,
    'child': 0,
    'seat_infant_under': 0,
  };

  String get classes => _classes;
  
  void updateClass(String newClass){
    _classes = newClass;
    update();
  }

  void onChangeTraveler(String type, int number){
    travelers[type] = number;//to update map key value
    // update(["id"]);
    update();
  }
}