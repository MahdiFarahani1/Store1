import 'package:flutter/material.dart';
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
                        child: Assets.images.menu.image(width: 32, height: 32));
                  }),
                  const SizedBox(width: 8),
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: const Text("(0781 - 8100 - 222)")),
                  const SizedBox(width: 2.5),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Assets.images.arrowDown.image(width: 19, height: 19),
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
                  child: Assets.images.searchIcon.image(width: 27, height: 27)),
              const SizedBox(width: 15),
              Assets.images.notif.image(width: 27, height: 27),
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
