import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/widgets/backBtn.dart';
import 'package:flutter_application_1/Features/save_notfication/view/widget/item_notfi.dart';

class SaveNotification extends StatelessWidget {
  const SaveNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الاشعارات",
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                BackBtn(),
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
