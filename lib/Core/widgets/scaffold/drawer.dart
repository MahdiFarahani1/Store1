import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';

class CustomDrawer {
  static TextStyle aboutStyle() {
    return TextStyle(color: Colors.grey, fontSize: 11);
  }

  static dynamic dialog(BuildContext context) {
    return showModalBottomSheet(
      elevation: 20,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Container(
                    width: 43,
                    height: 4,
                    decoration: BoxDecoration(
                        color: ConstColor.backgroundColor,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: ConstColor.iconColor,
                          ),
                          title: const Text('الملف الشخصي'),
                          subtitle: Text('تعديل المعلومات الشخصية وكلمة المرور',
                              style: aboutStyle()),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('الاشعارات'),
                          subtitle: Text('ارشيف الاشعارات المستلمة ',
                              style: aboutStyle()),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.notifications),
                          title: const Text('حول التطبيق'),
                          subtitle:
                              Text('تعريف بخدمات التطبيق', style: aboutStyle()),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('سياسية الخصوصية'),
                          subtitle: Text('بنود ومعلومات سياسة الخصوصية',
                              style: aboutStyle()),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('الدعم الفني'),
                          subtitle: Text('ارقام ومعلومات الدعم الفني',
                              style: aboutStyle()),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('الشروط والقوانين'),
                          subtitle: Text('الالتزام بالبنود والشروط',
                              style: aboutStyle()),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('خروج'),
                          subtitle:
                              Text('تسجيل خروج من الحساب', style: aboutStyle()),
                          onTap: () {
                            exit(0);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
