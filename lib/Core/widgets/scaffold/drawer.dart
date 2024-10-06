import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/login/view/signIn.dart';
import 'package:flutter_application_1/Features/save_notfication/view/save_notif.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer {
  static TextStyle aboutStyle() {
    return const TextStyle(color: Colors.grey, fontSize: 11);
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 43,
                      height: 4,
                      decoration: BoxDecoration(
                          color: ConstColor.lightIconColor,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.user,
                                colorFilter: ColorFilter.mode(
                                  ConstColor.lightIconColor,
                                  BlendMode.srcIn,
                                )),
                            title: const Text('الملف الشخصي'),
                            subtitle: Text(
                                'تعديل المعلومات الشخصية وكلمة المرور',
                                style: aboutStyle()),
                            onTap: () {
                              NavToPage.push(context, const LoginScreen());
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.notification,
                                colorFilter: ColorFilter.mode(
                                  ConstColor.lightIconColor,
                                  BlendMode.srcIn,
                                )),
                            title: const Text('الاشعارات'),
                            subtitle: Text('ارشيف الاشعارات المستلمة ',
                                style: aboutStyle()),
                            onTap: () {
                              NavToPage.push(context, const SaveNotification());
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.infoCircle,
                                colorFilter: ColorFilter.mode(
                                  ConstColor.lightIconColor,
                                  BlendMode.srcIn,
                                )),
                            title: const Text('حول التطبيق'),
                            subtitle: Text('تعريف بخدمات التطبيق',
                                style: aboutStyle()),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.shield,
                                colorFilter: ColorFilter.mode(
                                  ConstColor.lightIconColor,
                                  BlendMode.srcIn,
                                )),
                            title: const Text('سياسية الخصوصية'),
                            subtitle: Text('بنود ومعلومات سياسة الخصوصية',
                                style: aboutStyle()),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.headset,
                                colorFilter: ColorFilter.mode(
                                  ConstColor.lightIconColor,
                                  BlendMode.srcIn,
                                )),
                            title: const Text('الدعم الفني'),
                            subtitle: Text('ارقام ومعلومات الدعم الفني',
                                style: aboutStyle()),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.lock,
                                colorFilter: ColorFilter.mode(
                                  ConstColor.lightIconColor,
                                  BlendMode.srcIn,
                                )),
                            title: const Text('الشروط والقوانين'),
                            subtitle: Text('الالتزام بالبنود والشروط',
                                style: aboutStyle()),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: Transform.rotate(
                              angle: 3.14,
                              child: SvgPicture.asset(Assets.icons.logout,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  )),
                            ),
                            title: const Text('خروج'),
                            subtitle: Text('تسجيل خروج من الحساب',
                                style: aboutStyle()),
                            onTap: () {
                              exit(0);
                            },
                          ),
                          Container(
                            width: EsaySize.width(context),
                            height: 110,
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              "الاصدار: 1.0",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
