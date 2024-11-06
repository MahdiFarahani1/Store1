import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Core/widgets/backBtn.dart';
import 'package:flutter_application_1/Features/login/view/bloc/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/Features/login/view/signIn.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    BlocProvider.of<SignUpCubit>(context).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: EsaySize.width(context),
            height: EsaySize.height(context),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: BackBtn(),
                    )),
                EsaySize.safeGap(80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "حساب المستخدم",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ConstColor.getBgReverce(context),
                        ),
                      ),
                      EsaySize.gap(80),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Column(
                                children: [
                                  TextField(
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor:
                                        Theme.of(context).iconTheme.color!,
                                    decoration: InputDecoration(
                                      floatingLabelStyle: TextStyle(
                                          color: ConstColor.lightIconColor),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstColor.getIconColor(
                                                context),
                                            width: 2),
                                      ),
                                      labelText: 'البريد الالكتروني',
                                      prefixIcon:
                                          const Icon(Icons.person_outline),
                                    ),
                                  ),
                                  EsaySize.gap(20),
                                  TextField(
                                    style: const TextStyle(color: Colors.black),
                                    onChanged: (value) {
                                      BlocProvider.of<SignUpCubit>(context)
                                          .updatePasswordStrength(value);
                                    },
                                    cursorColor:
                                        Theme.of(context).iconTheme.color!,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      floatingLabelStyle: TextStyle(
                                          color: ConstColor.lightIconColor),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstColor.getIconColor(
                                                context),
                                            width: 2),
                                      ),
                                      labelText: 'كلمة المرور',
                                      prefixIcon:
                                          const Icon(Icons.lock_outline),
                                      suffixIcon:
                                          const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                  EsaySize.gap(20),
                                  BlocBuilder<SignUpCubit, SignUpState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: LinearPercentIndicator(
                                          animation: true,
                                          barRadius: const Radius.circular(20),
                                          lineHeight: 5,
                                          percent: state.passwordStrength,
                                          progressColor:
                                              BlocProvider.of<SignUpCubit>(
                                                      context)
                                                  .getpasswordColor(),
                                          backgroundColor: Colors.grey.shade300,
                                        ),
                                      );
                                    },
                                  ),
                                  EsaySize.gap(10),
                                  TextField(
                                    style: const TextStyle(color: Colors.black),
                                    cursorColor:
                                        Theme.of(context).iconTheme.color!,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      floatingLabelStyle: TextStyle(
                                          color: ConstColor.lightIconColor),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstColor.getIconColor(
                                                context),
                                            width: 2),
                                      ),
                                      labelText: 'تكرار كلمة المرور',
                                      prefixIcon:
                                          const Icon(Icons.lock_outline),
                                      suffixIcon:
                                          const Icon(Icons.visibility_off),
                                    ),
                                  ),
                                  EsaySize.gap(20),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).iconTheme.color!,
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
                                        'دخــــول',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            top: -50,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor:
                                      Theme.of(context).iconTheme.color!,
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
                      EsaySize.gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("ليس لديك حساب؟"),
                          TextButton(
                            onPressed: () {
                              NavToPage.push(context, const SignInScreen());
                            },
                            child: Text(
                              "دخــــول",
                              style:
                                  TextStyle(color: ConstColor.lightIconColor),
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
