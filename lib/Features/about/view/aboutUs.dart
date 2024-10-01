import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    String infoContent =
        "شركة وادي فون هي الوكيل الرئيسي لشركة اسياسيل للاتصالات، بدأت ادارة الشركة العمل وكيل رئيسي لشركة اسياسيل في سنة عام ٢٠١٠م وكان اسم الشركة حينها ((نهار المدينة)) ومضت إدارة الشركة تحقق النجاح تلو الاخر ومن ثم استلمت الادارة ((شركة وادي فون )) وتدرجت النجاحات حتى انتقلت إلى أعلى المستويات واصبحت الاولى على الوكلاء الرئيسيين لشركة آسياسيل في العراق من حيث الأداء وتقنية التعامل المتطورة وأساليب التسويق الحديثة وكفاءة اختيار كادر العمل.";

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: ConstColor.bgGrey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
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
                          height: 15,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(80)),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    // عنوان
                    const Text(
                      "درباره ما",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      infoContent,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    EsaySize.gap(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
