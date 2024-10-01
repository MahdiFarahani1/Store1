import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/reports/view/bloc/cubit/itemPicker/itemPicker_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  DateTime today = DateTime.now();
  List<DateTime?> _dates = [
    DateTime(DateTime.now().year, DateTime.now().month, 1),
    DateTime(DateTime.now().year, DateTime.now().month, 30),
  ];
  final PageController _pageController = PageController(viewportFraction: 0.3);
  final PageController _pageController2 = PageController(viewportFraction: 0.3);

  int _currentPage1 = 0;
  int _currentPage2 = 0;

  String item = '';
  String price = '';
  @override
  void initState() {
    item = BlocProvider.of<ItemPickerCubit>(context).state.data[0];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () async {
              var results = await showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      calendarType: CalendarDatePicker2Type.range,
                    ),
                    value: _dates,
                    onValueChanged: (dates) {
                      setState(() {
                        _dates = dates;
                      });
                    },
                  ),
                ),
              );
              if (results != null) {
                setState(() {
                  _dates = results;
                });
              }
            },
            child: Card(
              elevation: 0,
              child: Container(
                width: EsaySize.width(context),
                height: 50,
                decoration: BoxDecoration(
                  color: ConstColor.bgGrey,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: ConstColor.backgroundColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Assets.images.date.image(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor:
                                  ConstColor.iconColor.withAlpha(50),
                            ),
                            EsaySize.gap(4),
                            const Text(
                              "2024/09/30",
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "الی",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 4,
                              backgroundColor:
                                  ConstColor.iconColor.withAlpha(50),
                            ),
                            EsaySize.gap(4),
                            const Text(
                              "2024/09/30",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<ItemPickerCubit, ReportState>(
          builder: (context, state) {
            return Card(
              shape: const BeveledRectangleBorder(),
              margin: const EdgeInsets.all(0),
              color: ConstColor.bgGrey,
              elevation: 0,
              child: SizedBox(
                width: EsaySize.width(context),
                height: 55,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        color: ConstColor.iconColor,
                        child: Container(
                          width: 100,
                        ),
                      ),
                    ),
                    PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.data.length,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage1 = index;
                        });
                        item = state.data[index];
                      },
                      itemBuilder: (context, index) {
                        bool isActive = index == _currentPage1;

                        return Center(
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              fontSize: isActive ? 20 : 16,
                              fontWeight: isActive
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            child: Text(
                              state.data[index],
                              style: TextStyle(
                                color: isActive
                                    ? Colors.black
                                    : Colors.black87.withOpacity(0.5),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Card(
          shape: const BeveledRectangleBorder(),
          margin: const EdgeInsets.all(0),
          color: ConstColor.bgGrey,
          elevation: 0,
          child: SizedBox(
            width: EsaySize.width(context),
            height: 55,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    margin: const EdgeInsets.all(0),
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    color: ConstColor.iconColor,
                    child: Container(
                      width: 100,
                    ),
                  ),
                ),
                PageView.builder(
                  controller: _pageController2,
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage2 = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    bool isActive = index == _currentPage2;

                    return Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          fontSize: isActive ? 20 : 16,
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                        child: Text(
                          '${1 * index}',
                          style: TextStyle(
                            color: isActive
                                ? Colors.black
                                : Colors.black87.withOpacity(0.5),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              BlocProvider.of<ItemPickerCubit>(context)
                  .send(item: item, price: price);
            },
            child: Card(
              elevation: 0,
              child: Container(
                width: EsaySize.width(context),
                height: 50,
                decoration: BoxDecoration(
                  color: ConstColor.iconColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: SizedBox(
                          width: 20,
                          height: 40,
                          child: Center(
                              child: Text(
                            "Send",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: ConstColor.backgroundColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Assets.images.send.image(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
