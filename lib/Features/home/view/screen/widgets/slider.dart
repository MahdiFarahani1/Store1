import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/home/view/bloc/slider/cubit/slider_cubit.dart';
import 'package:flutter_application_1/page2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SliderWidget extends StatelessWidget {
  final List imageList;

  SliderWidget({super.key, required this.imageList});

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  BlocProvider.of<SliderCubit>(context)
                      .changeIndicatorSlider(index);
                },
                initialPage: state.indexSlider,
                height: 150.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: imageList.asMap().entries.map((entry) {
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
                              imageList: imageList,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: "hero-image-$index",
                        child: Card(
                          margin: const EdgeInsets.all(0),
                          child: Image.asset(
                            width: EsaySize.width(context) - 100,
                            imageUrl,
                            fit: BoxFit.fill,
                          ).radiusAll(8),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            EsaySize.gap(6),
            _animatedIndecator(context, state),
          ],
        );
      },
    );
  }

  Container _animatedIndecator(BuildContext context, SliderState state) {
    return Container(
      width: EsaySize.width(context),
      color: Colors.black.withOpacity(0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: state.indexSlider == entry.key ? 30.0 : 10.0,
              height: 2.5,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: state.indexSlider == entry.key
                    ? ConstColor.lightIconColor
                    : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
