import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Features/home/view/screen/main_wraper.dart';
import 'package:flutter_application_1/Features/save_notfication/view/widget/item_notfi.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class SaveNotification extends StatelessWidget {
  const SaveNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "الاشعارات",
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    NavToPage.push(context, const MainWraper());
                  },
                  child: SvgPicture.asset(
                    Assets.icons.arrowLeft,
                    width: 35,
                    height: 35,
                  ),
                ),
              ],
            ),
          ).padAll(12),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ItemNotif();
              },
            ),
          )
        ]),
      ),
    ));
  }
}
