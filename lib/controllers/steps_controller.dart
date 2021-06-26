import 'package:el_saha/view/destination/booking_trip_screen.dart';
import 'package:get/get.dart';

class StepsController extends GetxController{
  int _currentStep = 3;
  String classes = 'Economy';
  int traveler = 0;
  DateTime arrivalDate ;
  DateTime backDate ;

  int get currentStep => _currentStep;

  TypeTrip _typeTrip = TypeTrip.none;
  TypeTrip get typeTrip => _typeTrip;

  void onChange(int newStep){
    _currentStep = newStep;
    update();
  }

  void updateTripType(TypeTrip newType){
    _typeTrip = newType;
    update();
  }
}