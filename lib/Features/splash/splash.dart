import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/home/view/screen/main_wraper.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        NavToPage.pushReplacement(context, const MainWraper());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: EsaySize.width(context),
          height: EsaySize.height(context),
          child: Stack(
            children: [
              SizedBox(
                width: EsaySize.width(context),
                height: EsaySize.height(context),
                child: Image.asset(
                  Assets.images.bgSplash.path,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(Assets.images.centerSplash.path),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
