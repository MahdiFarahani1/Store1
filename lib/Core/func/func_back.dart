import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class NavToPage {
  static push(BuildContext context, Widget className) {
    Navigator.pop(context);
    Navigator.push(context,
        PageTransition(child: className, type: PageTransitionType.fade));
  }

  static pushReplacement(BuildContext context, Widget className) {
    Navigator.pushReplacement(context,
        PageTransition(child: className, type: PageTransitionType.fade));
  }
}
