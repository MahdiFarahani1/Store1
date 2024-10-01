import 'package:flutter/material.dart';

extension WidgetsEx on Widget {
  Widget padAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget radiusAll(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  Widget sizeWH(double W, double H) {
    return SizedBox(
      width: W,
      height: H,
      child: this,
    );
  }
}
