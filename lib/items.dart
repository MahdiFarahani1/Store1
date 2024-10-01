import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';

class Items {
  static Widget item1() {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      width: 75,
      height: 85,
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ConstColor.iconColor),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: const Icon(
                    Icons.gamepad_sharp,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: -3,
                  child: Icon(
                    Icons.arrow_drop_down_circle_rounded,
                    size: 24,
                    color: ConstColor.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "گروه نمایش",
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
