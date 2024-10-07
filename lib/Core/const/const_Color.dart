import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConstColor {
  static Color lightIconColor =
      const Color.fromARGB(255, 50, 85, 157); //#32559D00
  static Color lightBackgroundColor =
      const Color.fromARGB(255, 205, 215, 235); //#CDD7EBCC

  static Color lightBgGrey = const Color.fromARGB(255, 235, 235, 235);
  static Color lightBgTeel = const Color.fromARGB(255, 65, 170, 170);

  static Color darkIconColor = const Color.fromARGB(255, 150, 180, 230);
  static Color darkBackgroundColor = const Color.fromARGB(255, 30, 30, 50);
  static Color darkBgGrey = const Color.fromARGB(255, 60, 60, 60);
  static Color darkBgTeel = const Color.fromARGB(255, 30, 130, 130);

  static Color getIconColor(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).state.isDark
        ? darkIconColor
        : lightIconColor;
  }

  static Color getBackgroundColor(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).state.isDark
        ? darkBackgroundColor
        : lightBackgroundColor;
  }

  static Color getBgGrey(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).state.isDark
        ? darkBgGrey
        : lightBgGrey;
  }

  static Color getBgTeel(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).state.isDark
        ? darkBgTeel
        : lightBgTeel;
  }
}
