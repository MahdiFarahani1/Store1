import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading {
  static Widget pulse(BuildContext context) {
    return SpinKitPulse(
      itemBuilder: (context, index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey,
          ),
        );
      },
    );
  }

  static Widget loadLine(BuildContext context) {
    return SpinKitThreeInOut(
      size: 35,
      itemBuilder: (context, index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
        );
      },
    );
  }

  static Widget wave(BuildContext context) {
    return SpinKitWave(
      size: 35,
      itemBuilder: (context, index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
        );
      },
    );
  }
}
