import 'package:get/get.dart';

class ProductDetailsController extends GetxController{

  int _selectedImage = 0;
  int get selectedImage =>_selectedImage;

  void updateSelectedImage(int index){
    _selectedImage = index;
    update();
  }
}