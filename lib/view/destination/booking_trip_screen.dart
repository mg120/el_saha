import 'package:el_saha/controllers/steps_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingTripScreen extends StatelessWidget {
  final String selectedDest;
  final Color colorActive = Color(0xff00D7FF);
  // Rx<TypeTrip> _typeTrip = TypeTrip.none.obs;
  final stepController = Get.put(StepsController());
  DateTime selectedDate = DateTime.now();
  DateTime lastDate = DateTime(DateTime.now().year + 1 ,);

  BookingTripScreen({Key key, this.selectedDest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(lastDate);
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Stepper"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            margin: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    SvgPicture.asset(
                      'assets/images/location.svg',
                      color: colorActive,
                    ),
                    customizeVerticalDivider(colorActive),
                    SvgPicture.asset(
                      'assets/images/destination.svg',
                      color: colorActive,
                    ),
                    customizeVerticalDivider(colorActive),
                    SvgPicture.asset(
                      'assets/images/send-mail.svg',
                      color: stepController.currentStep > 3
                          ? colorActive
                          : Colors.grey,
                    ),
                    customizeVerticalDivider(stepController.currentStep > 3
                        ? colorActive
                        : Colors.grey),
                    SvgPicture.asset(
                      'assets/images/calender.svg',
                      color: stepController.currentStep > 4
                          ? colorActive
                          : Colors.grey,
                    ),
                    customizeVerticalDivider(stepController.currentStep > 4
                        ? colorActive
                        : Colors.grey),
                    SvgPicture.asset(
                      'assets/images/baby.svg',
                      color: stepController.currentStep > 5
                          ? colorActive
                          : Colors.grey,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
                SizedBox(width: 20),
                GetBuilder<StepsController>(
                  builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text('Medea'),
                        width: Get.width * 0.75,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorActive),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(selectedDest),
                        width: Get.width * 0.75,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: colorActive),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            typeTrip(
                              'One Way',
                              stepController.typeTrip == TypeTrip.oneWay,
                              TypeTrip.oneWay,
                            ),
                            typeTrip(
                              'Round Trip',
                              stepController.typeTrip == TypeTrip.roundTrip,
                              TypeTrip.roundTrip,
                            ),
                            typeTrip(
                              'Multi City',
                              stepController.typeTrip == TypeTrip.multiCity,
                              TypeTrip.multiCity,
                            ),
                          ],
                        ),
                      ),
                      stepController.currentStep >= 4
                          ?  Container(
                        width: Get.width * 0.75,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: stepController.currentStep == 4 ? Colors.grey : colorActive,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final DateTime arrivalDate = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: selectedDate,
                                  lastDate: lastDate,
                                );
                                if (arrivalDate != null && arrivalDate != selectedDate) {
                                  stepController.arrivalDate = arrivalDate;
                                  stepController.update();
                                  print(stepController.arrivalDate.toString());
                                }
                              },
                              child: Container(
                                width: Get.width * 0.357,
                                height: 55,
                                alignment: Alignment.center,
                                child: Text(
                                  stepController.arrivalDate == null
                                      ? '1 Jun 2021'
                                      : stepController.arrivalDate.toString().substring(0, 10),
                                  style: TextStyle(
                                    color: stepController.arrivalDate == null ? Colors.grey : null,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final DateTime backDate = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: selectedDate,
                                  lastDate: lastDate,
                                );
                                stepController.arrivalDate.isAfter(backDate)? print("Error, not valid dates"):print("true selection");
                                if (backDate != null && backDate != selectedDate && stepController.currentStep == 4) {
                                  stepController.backDate = backDate;
                                  stepController.onChange(5);
                                }
                                stepController.update();
                                print(stepController.currentStep);
                              },
                              child: Container(
                                width: Get.width * 0.357,
                                height: 55,
                                alignment: Alignment.center,
                                child: Text(
                                  stepController.backDate == null
                                      ? '1 Jun 2021'
                                      : stepController.backDate.toString().substring(0, 10),
                                  style: TextStyle(
                                    color: stepController.backDate == null ? Colors.grey : null,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                          : SizedBox(height: 55),
                      stepController.currentStep >= 5
                          ? selectClassesAndTraveler()
                          : SizedBox(height: 55),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageIcon(String assetName) {
    SvgPicture.asset(
      assetName,
      color: colorActive,
    );
  }

  Widget customizeVerticalDivider(Color color) {
    return Expanded(
      child: Container(
        child: VerticalDivider(
          color: color,
          thickness: 2,
        ),
      ),
    );
  }

  Widget typeTrip(String txt, bool isSelected, TypeTrip typeTrip) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        stepController.updateTripType(typeTrip);
        if (stepController.currentStep == 3) {
          stepController.onChange(4);
        }
        print(stepController.currentStep);
        stepController.update();
      },
      child: Container(
        child: Text(
          txt,
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
        alignment: Alignment.center,
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff00D8CB) : Color(0xffEDF2F8),
          border: !isSelected ? Border.all(color: Color(0xffCAD0D6)) : null,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color(0xff00D8CB),
                    blurRadius: 20,
                    spreadRadius: -5,
                  )
                ]
              : null,
        ),
      ),
    );
  }

  Widget selectClassesAndTraveler() {
    // bool isSelected = classTravelerController.isSelected;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        // await Get.to(ClassTravelerScreen());
        // stepController.onChanged(6);
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: Get.width * 0.357,
              height: 55,
              alignment: Alignment.center,
              child: Text(
                "Econmy",
                // isSelected ? classTravelerController.classes : 'Economy',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: Get.width * 0.357,
              height: 55,
              alignment: Alignment.center,
              child: Text(
                "0 traveler",
                // isSelected
                //     ? '${classTravelerController.numTravelers} Traveler'
                //     : '0 Traveler',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        width: Get.width * 0.75,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: stepController.currentStep == 5 ? colorActive:Colors.grey,
          ),
        ),
      ),
    );
  }
}

enum TypeTrip {
  oneWay,
  roundTrip,
  multiCity,
  none,
}
