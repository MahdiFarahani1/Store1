import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EsaySize {
  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static Widget gap(double value) {
    return Gap(value);
  }

  static Widget safeGap(double value) {
    return MaxGap(value);
  }
}
