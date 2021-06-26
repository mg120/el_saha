import 'package:get/get.dart';

class RequestedJobController extends GetxController{

  bool _showContainer = true;

  bool get showContainer => _showContainer;

  void updateContainerVisibility(){
    _showContainer = !_showContainer;
    print(_showContainer.toString());
    update();
  }
  // List<>
}