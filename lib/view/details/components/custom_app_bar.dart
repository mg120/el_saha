import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends PreferredSize {
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 20,
                    child: SvgPicture.asset("assets/icons/Back ICon.svg"),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Text("4.0"),
                      SizedBox(
                        width: 6.0,
                      ),
                      SvgPicture.asset("assets/icons/Star Icon.svg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        preferredSize: preferredSize);
  }
}
