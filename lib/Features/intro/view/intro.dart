import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/intro/view/bloc/cubit/intro_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    List<String> introImageList = [
      Assets.intro.modernDesign,
      Assets.intro.performanceOverview,
      Assets.intro.myNotifications,
    ];
    const List<String> titleList = [
      'دعم فني متواصل',
      'تغطية لمعظم المحافظات العراقية',
      'تنوع في عرض البطاقات والكروت'
    ];
    const List<String> contentList = [
      'دعم فني متواصل على مدار الساعة، نضمن تواجدنا لمساعدتك في أي وقت تحتاج فيه إلى الدعم.',
      'ننشط في اغلب المحافظات العراقية، نتميز بطاقم اداري متخصص وذو خبرة واسعة في هذا المجال.',
      'نظام متكامل لبيع وتسويق البطاقات الالكترونية المحلية والعالمية متخصصة في مجال بطاقات تعبئة الأرصدة لمختلف الشركات المحلية و العالمية.',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: EsaySize.width(context),
        height: EsaySize.height(context),
        child: Column(
          children: [
            SizedBox(
              width: EsaySize.width(context),
              height: EsaySize.height(context) / 1.2,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  context.read<IntroCubit>().changeState(value);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return DelayedWidget(
                    delayDuration: const Duration(milliseconds: 200),
                    animationDuration: const Duration(seconds: 1),
                    animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SvgPicture.asset(
                            width: EsaySize.width(context),
                            height: 200,
                            fit: BoxFit.fill,
                            introImageList[index],
                          ),
                        ),
                        Text(
                          titleList[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromARGB(255, 30, 30, 30)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            textDirection: TextDirection.rtl,
                            contentList[index],
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<IntroCubit, IntroState>(
              builder: (context, state) {
                return AnimatedSmoothIndicator(
                  activeIndex: state.indexIntro,
                  count: 3,
                  effect: const WormEffect(dotWidth: 7, dotHeight: 7),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context
                      .read<IntroCubit>()
                      .changeStateWithBtn(pageController, context);
                },
                child: Card(
                  color: ConstColor.lightIconColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    alignment: Alignment.center,
                    width: EsaySize.width(context),
                    child: BlocBuilder<IntroCubit, IntroState>(
                      builder: (context, state) {
                        return Text(
                          state.textBtn,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        );
                      },
                    ).padAll(12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
