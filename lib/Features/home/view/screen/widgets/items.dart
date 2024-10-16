import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class Items {
  static Widget item1({required Color color, required String assetsName}) {
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
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.images.bgItem.path,
                      ),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: color, width: 0.5),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      assetsName,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: -3,
                  child: Icon(
                    Icons.arrow_drop_down_circle_rounded,
                    size: 24,
                    color: color,
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
