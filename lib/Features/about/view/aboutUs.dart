import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

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
              _logo(),
              Container(
                width: 55,
                height: 5,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                          color: ConstColor.lightIconColor)
                    ],
                    color: Theme.of(context).primaryColor,
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
                          _socialBtn(context, pathImage: Assets.icons.gmail),
                          EsaySize.gap(20),
                          _socialBtn(context, pathImage: Assets.icons.globe),
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

  Widget _socialBtn(BuildContext context, {required String pathImage}) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {},
      child: Card(
        color: ConstColor.lightBgGrey,
        elevation: 4,
        shadowColor: Theme.of(context).primaryColor,
        child: SvgPicture.asset(pathImage,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            )).padAll(8),
      ),
    );
  }

  ClipRRect _logo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        Assets.images.centerSplash.path,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
