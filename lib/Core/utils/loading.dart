import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading {
  static Widget pulse(BuildContext context) {
    return SpinKitPulse(
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ConstColor.getIconColor(context),
          ),
        );
      },
    ).padAll(8);
  }

  static Widget loadLine(BuildContext context) {
    return SpinKitThreeInOut(
      size: 35,
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: ConstColor.getIconColor(context),
          ),
        );
      },
    ).padAll(8);
  }

  static Widget fadingCircle(BuildContext context) {
    return SpinKitFadingCircle(
      size: 35,
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: ConstColor.getIconColor(context),
          ),
        );
      },
    ).padAll(8);
  }
}
