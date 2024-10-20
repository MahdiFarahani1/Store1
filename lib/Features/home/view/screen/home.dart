import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/color_list.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/func/func_back.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/contentCards/view/content_cards.dart';
import 'package:flutter_application_1/Features/contentCards/view/print.dart';

import 'package:flutter_application_1/Features/home/view/bloc/cubit/provider_cubit.dart';
import 'package:flutter_application_1/Features/home/view/screen/widgets/slider.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/Features/home/view/screen/widgets/items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, VoidCallback> clickMap = {
    'image': () {
      print('image clicked!');
    },
    'share': () {
      print('share clicked!');
    },
    'print': () {
      print("");
    },
    'copy': () {
      print('copy clicked!');
    },
    'sms': () {
      print('sms clicked!');
    },
    'charging': () {
      print('charging clicked!');
    },
  };
  @override
  void initState() {
    clickMap['print'] = () {
      NavToPage.push(context, const MyPrintPage());
    };
    BlocProvider.of<ProviderCubit>(context).fetchData();

    super.initState();
  }

  final PageController _pageController = PageController(viewportFraction: 0.3);

  final List<String> imageList = [
    Assets.images.test1.path,
    Assets.images.test2.path,
    Assets.images.test3.path,
    Assets.images.test4.path,
  ];
  List nameItem = [
    'عنوان 1 ',
    'عنوان 2 ',
    'عنوان 3 ',
    'عنوان 4 ',
    'عنوان 5 ',
    'عنوان 6 ',
    'عنوان 7 ',
    'عنوان 8 ',
    'عنوان 9 ',
    'عنوان 10 ',
    'عنوان 11',
  ];
  List iconItem = [
    Assets.icons.adobeIndesign,
    Assets.icons.apple,
    Assets.icons.android,
    Assets.icons.gamepad,
    Assets.icons.dialpad,
    Assets.icons.fastForward,
    Assets.icons.timer,
    Assets.icons.apple,
    Assets.icons.apple,
    Assets.icons.apple,
    Assets.icons.apple,
  ];

  List<String> cardList = [
    Assets.images.test1.path,
    Assets.images.test2.path,
    Assets.images.test3.path,
    Assets.images.test4.path,
    Assets.images.test5.path,
    Assets.images.test6.path,
    Assets.images.test7.path,
    Assets.images.test3.path,
    Assets.images.test5.path,
    Assets.images.test1.path,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SliderWidget(
            imageList: imageList,
          ).padAll(8),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 12),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).iconTheme.color!,
                  ),
                  width: 7,
                  height: 7,
                ),
                EsaySize.gap(5),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الاقسام الرئيسية",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: iconItem.length,
                itemBuilder: (context, index) {
                  return Items.item1(
                      color: colors[index],
                      assetsName: iconItem[index],
                      nameItem: nameItem[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 16),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 110,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 3) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: MediaQuery.sizeOf(context).width - 80,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          )),
                      child: const Center(
                        child: Text(
                          "موارد بیشتر...",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: MediaQuery.sizeOf(context).width - 80,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.images.bgItem.path),
                            fit: BoxFit.fitWidth),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        )),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 12, bottom: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).iconTheme.color!,
                  ),
                  width: 7,
                  height: 7,
                ),
                EsaySize.gap(5),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الفئات",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          EsaySize.gap(4),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                padding: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 16 / 9,
                  mainAxisExtent: 130,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      contentCards(context, colors[index], _pageController,
                          clickMap: clickMap);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(1),
                      elevation: 4,
                      shadowColor: colors[index],
                      child: Image.asset(
                        cardList[index],
                        fit: BoxFit.fill,
                      ).radiusAll(8),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
