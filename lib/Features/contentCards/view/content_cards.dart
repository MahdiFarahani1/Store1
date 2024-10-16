import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';

dynamic contentCards(
    BuildContext context, Color color, PageController pageController) {
  int currentPage = 0;
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
    builder: (context) {
      return SizedBox(
        width: EsaySize.width(context),
        height: EsaySize.height(context) / 1.5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 43,
                height: 4,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(12)),
              ).padAll(8),
              EsaySize.gap(20),
              _imageProduct(color, context, Assets.images.test2.path),
              EsaySize.gap(20),
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "ایرانسل",
                        style: TextStyle(color: color),
                      ),
                      EsaySize.gap(4),
                      const Text(": شرکت"),
                    ],
                  )).padAll(8),
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "1200",
                        style: TextStyle(color: color),
                      ),
                      EsaySize.gap(4),
                      const Text(": قیمت"),
                    ],
                  )).padAll(8),
              _numberProduct(color, context, currentPage, pageController),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconItem(Assets.icons.printer, "پرینت", color),
                    _buildIconItem(Assets.icons.share, "شير", color),
                    _buildIconItem(Assets.icons.image, "عكس", color),
                    _buildIconItem(Assets.icons.copy, "كپى", color),
                    _buildIconItem(
                      Assets.icons.mobilePhone,
                      "شارژ مستقيم",
                      color,
                    ),
                    _buildIconItem(Assets.icons.comment, "SMS", color),
                  ],
                ),
              ),
              EsaySize.gap(40),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: EsaySize.width(context) / 1.5,
                  height: 40,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text(
                            "ارسال",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4))),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset(Assets.icons.send,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Container _numberProduct(Color color, BuildContext context, int currentPage,
    PageController pageController) {
  return Container(
    alignment: Alignment.centerRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: color,
    ),
    margin: const EdgeInsets.only(left: 35, right: 35, top: 8),
    width: EsaySize.width(context),
    height: 40,
    child: Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: StatefulBuilder(builder: (context, setState) {
                  return PageView.builder(
                    onPageChanged: (value) {
                      setState(
                        () {
                          currentPage = value;
                        },
                      );
                    },
                    controller: pageController,
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      bool isActive = index == currentPage;
                      return Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          child: TextButton(
                              onPressed: () {
                                pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                style: TextStyle(
                                    fontSize: isActive ? 16 : 14,
                                    fontWeight: isActive
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color:
                                        isActive ? Colors.black : Colors.white),
                                child: Text(
                                  "${index + 1}",
                                ),
                              )));
                    },
                  );
                }),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4))),
            child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "تعداد :",
                  textDirection: TextDirection.rtl,
                )),
          ),
        ),
      ],
    ),
  );
}

Widget _imageProduct(Color color, BuildContext context, String pathImage) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 65),
    child: Card(
      margin: const EdgeInsets.all(0),
      elevation: 4,
      shadowColor: color,
      child: SizedBox(
        width: EsaySize.width(context),
        height: 150,
        child: Image.asset(
          pathImage,
          fit: BoxFit.fill,
        ).radiusAll(6),
      ),
    ),
  );
}

Widget _buildIconItem(String icon, String label, Color color) {
  return Container(
    width: 40,
    height: 40,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SvgPicture.asset(icon,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          )),
    ),
  );
}
