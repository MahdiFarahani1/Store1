import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/bloc/cubit/navbar_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget customNavbar(PageController pageController) {
  return BlocBuilder<NavbarCubit, NavbarState>(
    builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: FlashyTabBar(
          iconSize: 22,
          selectedIndex: state.index,
          showElevation: true,
          onItemSelected: (value) => BlocProvider.of<NavbarCubit>(context)
              .changeNavbarState(value, context, pageController),
          items: [
            FlashyTabBarItem(
              inactiveColor: ConstColor.backgroundColor,
              activeColor: ConstColor.iconColor,
              icon: Assets.images.home.image(width: 28, height: 28),
              title: const Text('الرئيسية'),
            ),
            FlashyTabBarItem(
              inactiveColor: ConstColor.backgroundColor,
              activeColor: ConstColor.iconColor,
              icon: Assets.images.report.image(width: 28, height: 28),
              title: const Text('التقارير '),
            ),
            FlashyTabBarItem(
              inactiveColor: ConstColor.backgroundColor,
              activeColor: ConstColor.iconColor,
              icon: Assets.images.info.image(width: 28, height: 28),
              title: const Text('تعريف'),
            ),
            FlashyTabBarItem(
              inactiveColor: ConstColor.backgroundColor,
              activeColor: ConstColor.iconColor,
              icon: Assets.images.settings.image(width: 28, height: 28),
              title: const Text('الاعدادات'),
            ),
          ],
        ),
      );
    },
  );
}
