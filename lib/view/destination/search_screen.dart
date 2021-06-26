import 'package:el_saha/controllers/destination_controller.dart';
import 'package:el_saha/view/Destination/booking_trip_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDestination extends StatelessWidget {
  static const id = 'SearchDestination';
  TextEditingController destController = TextEditingController();


  List<String> destinations = [
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

  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    // final DestinationController c = Get.put(DestinationController());
    return GetBuilder<DestinationController>(
      init: DestinationController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 70,
          centerTitle: true,
          shadowColor: Color(0xff0E141D).withOpacity(0.3),
          elevation: 15,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff405064),
            ),
          ),
          title: controller.isSearching
              ? TextField(
                  controller: destController,
                  autofocus: true,
                  onChanged: (value) {
                    print(value);
                    controller.onSearchTextChanged(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Where to',
                  ),
                )
              : Text(
                  "All Destinations",
                ),
          actions: [
            controller.isSearching
                ? IconButton(icon: Icon(Icons.cancel), onPressed: () {controller.updateSearching(false);
                  controller.initDestination();})
                : IconButton(icon: Icon(Icons.search_rounded), onPressed: () {controller.updateSearching(true);})
          ],
        ),
        body: ListView.builder(
          itemCount: controller.filteredDes.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(controller.filteredDes[i]),
            onTap: () {
              print("itemClicked: ${controller.filteredDes[i]}");
              Get.to(BookingTripScreen(selectedDest: controller.filteredDes[i]), arguments: ["First data", "Second data"]);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('\$320', style: TextStyle(color: Colors.grey)),
                SizedBox(width: Get.width * 0.035),
                Text('.', style: TextStyle(color: Colors.grey)),
                SizedBox(width: Get.width * 0.035),
                Text('2h 25min', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
