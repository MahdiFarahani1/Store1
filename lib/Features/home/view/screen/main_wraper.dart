import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/bloc/navbar/navbar_cubit.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/drawer.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/navBar.dart';
import 'package:flutter_application_1/Features/Search/view/search.dart';
import 'package:flutter_application_1/Features/about/view/aboutUs.dart';
import 'package:flutter_application_1/Features/home/view/bloc/appbar/appbar_cubit.dart';
import 'package:flutter_application_1/Features/home/view/screen/home.dart';
import 'package:flutter_application_1/Features/reports/view/report.dart';
import 'package:flutter_application_1/Features/settings/view/screen/setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class MainWraper extends StatefulWidget {
  const MainWraper({super.key});

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Column(
        children: [
          BlocBuilder<AppbarCubit, AppbarState>(
            builder: (context, state) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: state.isDropdownOpen ? 100 : 0,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                child: state.isDropdownOpen
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "اطلاعات یوزر:\nاسم: Ali Saedi\nشماره همراه: (0781 - 8100 - 222)",
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      )
                    : null,
              );
            },
          ),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: PageView(
                onPageChanged: (value) {
                  BlocProvider.of<NavbarCubit>(context)
                      .onPageViewChanged(value);
                },
                controller: _pageController,
                children: const [
                  MyHomePage(),
                  ReportPage(),
                  AboutPage(),
                  SettingsPage(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: customNavbar(_pageController),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      CustomDrawer.dialog(context);
                    },
                    child: SvgPicture.asset(
                      width: 26,
                      height: 26,
                      Assets.icons.menu,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                    ),
                  );
                }),
                EsaySize.gap(8),
                const Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text("(0781 - 8100 - 222) علی ساعدی")),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: BlocBuilder<AppbarCubit, AppbarState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<AppbarCubit>(context)
                              .changeStateBox();
                        },
                        child: SvgPicture.asset(
                          state.imagePath,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                SearchWidget.dialog(context);
              },
              child: SvgPicture.asset(
                Assets.icons.search,
                width: 26,
                height: 26,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              ),
            ),
            EsaySize.gap(15),
            SvgPicture.asset(
              width: 26,
              height: 26,
              Assets.icons.notification,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
