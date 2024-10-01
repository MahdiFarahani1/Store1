import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/page2.dart';

// ignore: must_be_immutable
class SliderWidget extends StatefulWidget {
  final List imageList;
  int index1;
  SliderWidget({super.key, required this.imageList, required this.index1});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            widget.index1 = index;
          });
        },
        initialPage: widget.index1,
        height: 150.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: widget.imageList.asMap().entries.map((entry) {
        int index = entry.key;
        String imageUrl = entry.value;

        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(
                      imageList: widget.imageList,
                      index: index,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: "hero-image-$index",
                child: Card(
                    elevation: 20,
                    color: Colors.transparent,
                    margin: EdgeInsets.all(0),
                    child: Image.asset(
                      width: EsaySize.width(context) - 100,
                      imageUrl,
                      fit: BoxFit.cover,
                    )).radiusAll(16),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
