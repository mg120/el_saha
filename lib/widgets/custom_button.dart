import 'package:el_saha/utils/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomRaisedButton extends StatelessWidget {
  final String title;
  final Function function;

  const CustomRaisedButton({Key key, this.title, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        color: mainColor,
        onPressed: function,
        child: CustomText(title: title, color: whiteColor, fontSize: 20, alignment: Alignment.center,),
      ),
    );
  }
}
