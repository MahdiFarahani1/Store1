import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/login/view/signIn.dart';
import 'package:flutter_application_1/Features/save_notfication/view/save_notif.dart';
import 'package:flutter_application_1/Features/settings/view/bloc/version/version_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          color: Theme.of(context).iconTheme.color!,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.user,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                )),
                            title: Text('الملف الشخصي',
                                style: TextStyle(
                                    color: ConstColor.getBgReverce(context))),
                            subtitle: Text(
                                'تعديل المعلومات الشخصية وكلمة المرور',
                                style: aboutStyle()),
                            onTap: () {
                              NavToPage.push(context, const SignInScreen());
                            },
                          ),
                          const Divider(),
                          ListTile(
                            leading: SvgPicture.asset(Assets.icons.notification,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                )),
                            title: Text('الاشعارات',
                                style: TextStyle(
                                    color: ConstColor.getBgReverce(context))),
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
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                )),
                            title: Text('حول التطبيق',
                                style: TextStyle(
                                    color: ConstColor.getBgReverce(context))),
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
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                )),
                            title: Text('سياسية الخصوصية',
                                style: TextStyle(
                                    color: ConstColor.getBgReverce(context))),
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
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                )),
                            title: Text('الدعم الفني',
                                style: TextStyle(
                                    color: ConstColor.getBgReverce(context))),
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
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                )),
                            title: Text(
                              'الشروط والقوانين',
                              style: TextStyle(
                                  color: ConstColor.getBgReverce(context)),
                            ),
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
                            title: const Text(
                              'خروج',
                              style: TextStyle(color: Colors.red),
                            ),
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
                            child: BlocBuilder<VersionCubit, VersionState>(
                              builder: (context, state) {
                                return Text(
                                  "الاصدار: ${state.appVersion}",
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                );
                              },
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
