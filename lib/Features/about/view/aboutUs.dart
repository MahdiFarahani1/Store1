import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    String infoContent =
        "ولمواكبة الوتيرة المتصاعدة في هذا المجال والذي أصبح فيه الانترنت والمواقع الالكترونية جزءا رئيسيا لا غنى عنه في إدارة أعمال المؤسسات والشركات لما يوفره من سرعة التواصل وانجاز الاعمال والذي اصبح مقياسا لكفاءة أي مؤسسة في عالم اليوم. بدأت هذه الفكرة عام 2017 بوجود موقع الكتروني متكامل يمكن الاعتماد عليه وبفضل الله سبحانه وتعالى تم توسعة نطاق عمل الشركة ليشمل عدة اقسام مهمة والتي تشمل بيع وتوزيع خطوط الهاتف النقال لشركة اسياسيل وبيع وتوزيع كروت التعبئة للخطوط مسبقة الدفع وخدمات مابعد البيع لمستخدمي خطوط شركة اسياسيل.";

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  Assets.images.centerSplash.path,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 55,
                height: 5,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                          color: ConstColor.iconColor)
                    ],
                    color: ConstColor.backgroundColor,
                    borderRadius: BorderRadius.circular(80)),
              ),
              EsaySize.gap(50),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EsaySize.gap(20),
                      const Text(
                        "حول التطبيق",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      EsaySize.gap(20),
                      Text(
                        infoContent,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      EsaySize.gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            color: ConstColor.bgGrey,
                            elevation: 4,
                            shadowColor: ConstColor.backgroundColor,
                            child: Assets.images.email
                                .image(width: 31, height: 31)
                                .padAll(8),
                          ),
                          EsaySize.gap(20),
                          Card(
                            color: ConstColor.bgGrey,
                            elevation: 4,
                            shadowColor: ConstColor.backgroundColor,
                            child: Assets.images.site
                                .image(width: 31, height: 31)
                                .padAll(8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
