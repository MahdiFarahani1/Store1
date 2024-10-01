import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';

class Page2 extends StatelessWidget {
  final List imageList;
  final int index;
  const Page2({super.key, required this.imageList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: EsaySize.width(context),
        height: EsaySize.height(context) / 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: EsaySize.width(context),
            height: EsaySize.height(context) / 4,
            child: Hero(
              tag: "hero-image-$index",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imageList[index],
                  fit: BoxFit.fitWidth,
                  width: EsaySize.width(context),
                  height: EsaySize.height(context) / 4,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
