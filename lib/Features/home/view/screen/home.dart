import 'dart:math';

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
            padding: EdgeInsets.only(
                left: MediaQuery.sizeOf(context).width - 70, top: 30),
            child: const Text(
              "محبوب ها",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Items.item1(),
                  Items.item1(),
                  Items.item1(),
                  Items.item1(),
                  Items.item1(),
                  Items.item1(),
                  Items.item1(),
                  Items.item1(),
                  Items.item1(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 16),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 120,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: MediaQuery.sizeOf(context).width - 80,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          border: Border.all(
                            color: ConstColor.iconColor,
                            width: 2,
                          )),
                      child: const Center(
                        child: Text(
                          "...موارد بیشتر",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: MediaQuery.sizeOf(context).width - 80,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255)),
                        border: Border.all(
                          color: ConstColor.iconColor,
                          width: 2,
                        )),
                  );
                },
              ),
            ),
          ),
          SizedBox(
              width: EsaySize.width(context),
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.grey,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.images.test2.path),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    EsaySize.gap(3),
                    Flexible(
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.orange,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.images.test4.path),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(8)),
                          height: 120,
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
