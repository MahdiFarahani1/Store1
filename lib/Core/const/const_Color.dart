import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConstColor {
  // light
  static Color lightIconColor = const Color.fromARGB(255, 50, 85, 157);
  static Color lightBackgroundColor = const Color.fromARGB(255, 205, 215, 235);

  static Color lightBgGrey = const Color.fromARGB(255, 235, 235, 235);
  static Color lightBgReverce = Colors.black;
  static Color lightBgMain = Colors.white;

  //dark
  static Color darkIconColor = const Color.fromARGB(255, 50, 85, 157);
  static Color darkBackgroundColor = const Color.fromARGB(255, 205, 215, 235);
  static Color darkBgGrey = const Color.fromARGB(255, 60, 60, 60);
  static Color darkBgReverce = Colors.white;
  static Color darkBgMain = const Color.fromARGB(255, 44, 44, 44);
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

  static Color getBgReverce(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).state.isDark
        ? darkBgReverce
        : lightBgReverce;
  }

  static Color getBgMain(BuildContext context) {
    return BlocProvider.of<ThemeCubit>(context).state.isDark
        ? darkBgMain
        : lightBgMain;
  }
}
