import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/home/view/screen/main_wraper.dart';
import 'package:flutter_application_1/Features/login/view/signUp.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ConstColor.lightBgGrey,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: EsaySize.width(context),
            height: EsaySize.height(context),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          NavToPage.push(context, const MainWraper());
                        },
                        child: SvgPicture.asset(
                          Assets.icons.arrowLeft,
                          width: 35,
                          height: 35,
                        ),
                      ),
                    )),
                EsaySize.safeGap(80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "حساب المستخدم",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      EsaySize.gap(80),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  cursorColor: ConstColor.lightIconColor,
                                  decoration: InputDecoration(
                                    floatingLabelStyle: TextStyle(
                                        color: ConstColor.lightIconColor),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ConstColor.lightIconColor,
                                          width: 2),
                                    ),
                                    labelText: 'البريد الالكتروني',
                                    prefixIcon:
                                        const Icon(Icons.person_outline),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  cursorColor: ConstColor.lightIconColor,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    floatingLabelStyle: TextStyle(
                                        color: ConstColor.lightIconColor),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ConstColor.lightIconColor,
                                          width: 2),
                                    ),
                                    labelText: 'كلمة المرور',
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon:
                                        const Icon(Icons.visibility_off),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'نسيت كلمة المرور؟',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ConstColor.lightIconColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                EsaySize.gap(10),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ConstColor.lightIconColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    width: double.infinity,
                                    child: Center(
                                        child: Text(
                                      'الدخول ببصمة اليد أو الوجه',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned.fill(
                            top: -50,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: ConstColor.lightIconColor,
                                  child: SvgPicture.asset(
                                    Assets.icons.user,
                                    width: 45,
                                    height: 45,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("هل لديك حساب؟"),
                          TextButton(
                            onPressed: () {},
                            child: TextButton(
                              onPressed: () {
                                NavToPage.pushReplacement(
                                    context, const SignUpScreen());
                              },
                              child: Text(
                                "تسجيل",
                                style:
                                    TextStyle(color: ConstColor.lightIconColor),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
