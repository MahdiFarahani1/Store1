import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/color_list.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/Search/view/bloc/cubit/search_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
                            SvgPicture.asset(Assets.icons.search,
                                width: 25,
                                height: 25,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color!,
                                  BlendMode.srcIn,
                                )),
                            EsaySize.gap(8),
                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Colors.black),
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
                                  ? SvgPicture.asset(Assets.icons.microphone,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).iconTheme.color!,
                                        BlendMode.srcIn,
                                      ))
                                  : SvgPicture.asset(Assets.icons.microphoneOff,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).iconTheme.color!,
                                        BlendMode.srcIn,
                                      )),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  EsaySize.gap(16),
                  Text(
                    'دسته‌بندی‌ها',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  EsaySize.gap(8),
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
                        return StatefulBuilder(builder: (context, setState) {
                          return _buildCategoryFilterChip(
                            context,
                            categories[index],
                            colors[index],
                            _categorybool[index],
                            (selected) {
                              setState(
                                () {
                                  _categorybool[index] = selected;
                                },
                              );
                            },
                          );
                        });
                      }),
                    ),
                  ),
                  EsaySize.gap(24),
                  _listResult(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Expanded _listResult() {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: SvgPicture.asset(Assets.icons.image,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  )),
            ),
            title: Text('نتیجه $index',
                style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('توضیح کوتاه برای نتیجه $index'),
            trailing: SvgPicture.asset(Assets.icons.caretLeft,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                )),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }

  static Widget _buildCategoryFilterChip(
    BuildContext context,
    String label,
    Color color,
    bool isSelected,
    ValueChanged<bool> onSelected,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        autofocus: true,
        elevation: 4,
        pressElevation: 4,
        side: const BorderSide(color: Colors.white),
        shadowColor: Colors.grey,
        label: Text(label),
        selected: isSelected,
        onSelected: onSelected,
        selectedColor: color,
        backgroundColor: color,
        disabledColor: color.withOpacity(0.1),
        checkmarkColor: Theme.of(context).iconTheme.color!,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
