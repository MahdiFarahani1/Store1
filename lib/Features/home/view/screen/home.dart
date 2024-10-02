import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';

import 'package:flutter_application_1/Features/home/view/bloc/cubit/provider_cubit.dart';
import 'package:flutter_application_1/Features/home/view/screen/widgets/slider.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    BlocProvider.of<ProviderCubit>(context).fetchData();
    super.initState();
  }

  final List<String> imageList = [
    Assets.images.test1.path,
    Assets.images.test2.path,
    Assets.images.test3.path,
    Assets.images.test4.path,
  ];

  int index = 0;
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
    Colors.teal,
    Colors.amber,
    Colors.deepPurple,
    Colors.lime,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.lightBlue,
    Colors.black,
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
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SliderWidget(
                imageList: imageList,
                index1: index,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 12),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ConstColor.lightIconColor,
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Items.item1(colors[index]);
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
                    color: ConstColor.lightIconColor,
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
          SizedBox(
              width: EsaySize.width(context),
              height: 600,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 130,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shadowColor: colors[index],
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(cardList[index]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
