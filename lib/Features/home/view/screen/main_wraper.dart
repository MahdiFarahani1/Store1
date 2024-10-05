import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/bloc/cubit/navbar_cubit.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/drawer.dart';
import 'package:flutter_application_1/Core/widgets/scaffold/navBar.dart';
import 'package:flutter_application_1/Features/Search/view/search.dart';
import 'package:flutter_application_1/Features/about/view/aboutUs.dart';
import 'package:flutter_application_1/Features/home/view/screen/home.dart';
import 'package:flutter_application_1/Features/reports/view/report.dart';
import 'package:flutter_application_1/Features/settings/view/screen/setting.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MainWraper extends StatefulWidget {
  const MainWraper({super.key});

  @override
  State<MainWraper> createState() => _MainWraperState();
}

class _MainWraperState extends State<MainWraper> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                            ConstColor.lightIconColor, BlendMode.srcIn),
                      ),
                    );
                  }),
                  EsaySize.gap(8),
                  const Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text("(0781 - 8100 - 222) علی ساعدی")),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SvgPicture.asset(
                      Assets.icons.caretDown,
                      colorFilter: ColorFilter.mode(
                          ConstColor.lightIconColor, BlendMode.srcIn),
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
                      ConstColor.lightIconColor, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 15),
              SvgPicture.asset(
                width: 26,
                height: 26,
                Assets.icons.notification,
                colorFilter: ColorFilter.mode(
                    ConstColor.lightIconColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PageView(
          onPageChanged: (value) {
            BlocProvider.of<NavbarCubit>(context).onPageViewChanged(value);
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
      bottomNavigationBar: customNavbar(_pageController),
    );
  }
}
