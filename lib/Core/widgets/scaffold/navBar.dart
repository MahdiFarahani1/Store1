import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/bloc/navbar/navbar_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

Widget customNavbar(PageController pageController) {
  return BlocBuilder<NavbarCubit, NavbarState>(
    builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: FlashyTabBar(
          backgroundColor: ConstColor.getBgMain(context),
          height: 55,
          iconSize: 22,
          selectedIndex: state.index,
          showElevation: true,
          onItemSelected: (value) => BlocProvider.of<NavbarCubit>(context)
              .changeNavbarState(value, context, pageController),
          items: [
            FlashyTabBarItem(
              inactiveColor: Theme.of(context).primaryColor,
              activeColor: Theme.of(context).iconTheme.color!,
              icon: SvgPicture.asset(
                width: 30,
                height: 30,
                Assets.icons.home,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              ),
              title: const Text('الرئيسية'),
            ),
            FlashyTabBarItem(
              inactiveColor: Theme.of(context).primaryColor,
              activeColor: Theme.of(context).iconTheme.color!,
              icon: SvgPicture.asset(
                width: 30,
                height: 30,
                Assets.icons.document,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              ),
              title: const Text('التقارير '),
            ),
            FlashyTabBarItem(
              inactiveColor: Theme.of(context).primaryColor,
              activeColor: Theme.of(context).iconTheme.color!,
              icon: SvgPicture.asset(
                width: 30,
                height: 30,
                Assets.icons.infoCircle,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              ),
              title: const Text('تعريف'),
            ),
            FlashyTabBarItem(
              inactiveColor: Theme.of(context).primaryColor,
              activeColor: Theme.of(context).iconTheme.color!,
              icon: SvgPicture.asset(
                width: 30,
                height: 30,
                Assets.icons.settingsAlt,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              ),
              title: const Text('الاعدادات'),
            ),
          ],
        ),
      );
    },
  );
}
