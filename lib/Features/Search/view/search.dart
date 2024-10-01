import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Features/Search/view/bloc/cubit/search_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget {
  static final List<bool> _categorybool = List.generate(5, (_) {
    return true;
  });

  static dynamic dialog(BuildContext context) {
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
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return Row(
                          children: [
                            Assets.images.searchIcon
                                .image(width: 25, height: 25),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: state.textController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'جستجو...',
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                ),
                                onSubmitted: (value) {},
                              ),
                            ),
                            GestureDetector(
                                onLongPress: () =>
                                    BlocProvider.of<SearchCubit>(context)
                                        .startListening(),
                                onLongPressUp: () =>
                                    BlocProvider.of<SearchCubit>(context)
                                        .stopListening(),
                                child: state.isListening
                                    ? Assets.images.mic
                                        .image(width: 25, height: 25)
                                    : Assets.images.micDisabled
                                        .image(width: 25, height: 25)),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'دسته‌بندی‌ها',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(5, (index) {
                        final categories = [
                          'تکنولوژی',
                          'کتاب‌ها',
                          'لباس',
                          'وسایل خانه',
                          'محصولات زیبایی'
                        ];
                        return _buildCategoryChip(
                          categories[index],
                          ConstColor.iconColor,
                          _categorybool[index],
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: Assets.images.image
                                .image(width: 25, height: 25),
                          ),
                          title: Text('نتیجه $index',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500)),
                          subtitle: Text('توضیح کوتاه برای نتیجه $index'),
                          trailing: Assets.images.arrowBack
                              .image(width: 22, height: 22),
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildCategoryChip(String label, Color color, bool checker) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: StatefulBuilder(builder: (context, setState) {
        return InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            setState(
              () {
                checker
                    ? color = color.withAlpha(120)
                    : color = color.withAlpha(255);
                checker = !checker;
              },
            );
          },
          child: Chip(
            avatar: Icon(
              Icons.ac_unit_rounded,
              color: ConstColor.backgroundColor,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            elevation: 12,
            label: Text(label),
            backgroundColor: color,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        );
      }),
    );
  }
}
