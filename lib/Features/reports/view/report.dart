import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/reports/view/bloc/cubit/itemPicker/itemPicker_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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

  String item = '';
  String price = '';
  @override
  void initState() {
    item = BlocProvider.of<ReportCubit>(context).state.data[0];
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
          child: StatefulBuilder(builder: (context, setStateCalender) {
            return InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              onTap: () async {
                var results = await showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        selectedDayHighlightColor:
                            Theme.of(context).primaryColor,
                        selectedRangeHighlightColor:
                            Theme.of(context).primaryColor,
                        calendarType: CalendarDatePicker2Type.range,
                      ),
                      value: _dates,
                      onValueChanged: (dates) {
                        setStateCalender(() {
                          _dates = dates;
                        });
                      },
                    ),
                  ),
                );
                if (results != null) {
                  setStateCalender(() {
                    _dates = results;
                  });
                }
              },
              child: Card(
                elevation: 0,
                child: Container(
                  width: EsaySize.width(context),
                  height: 42,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
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
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(Assets.icons.calendar,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).iconTheme.color!,
                                    BlendMode.srcIn,
                                  )),
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
                                    ConstColor.lightIconColor.withAlpha(50),
                              ),
                              EsaySize.gap(4),
                              const Text(
                                "2024/09/30",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "الی",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor:
                                    ConstColor.lightIconColor.withAlpha(50),
                              ),
                              EsaySize.gap(4),
                              const Text(
                                "2024/09/30",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        Card(
          shape: const BeveledRectangleBorder(),
          margin: const EdgeInsets.all(0),
          color: Colors.white,
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
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      width: 100,
                    ),
                  ),
                ),
                BlocBuilder<ReportCubit, ReportState>(
                  builder: (context, state) {
                    return PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.data.length,
                      onPageChanged: (int index) {
                        BlocProvider.of<ReportCubit>(context)
                            .itemCompany(index);

                        item = state.data[index];
                      },
                      itemBuilder: (context, index) {
                        bool isActive =
                            index == state.itemPickerState.currentCompanyPage;

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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        EsaySize.gap(4),
        Card(
          shape: const BeveledRectangleBorder(),
          margin: const EdgeInsets.all(0),
          color: Colors.white,
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
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      width: 100,
                    ),
                  ),
                ),
                BlocBuilder<ReportCubit, ReportState>(
                  builder: (context, state) {
                    return PageView.builder(
                      controller: _pageController2,
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      onPageChanged: (int index) {
                        BlocProvider.of<ReportCubit>(context).itemPrice(index);
                      },
                      itemBuilder: (context, index) {
                        bool isActive =
                            index == state.itemPickerState.currentPricePage;

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
              BlocProvider.of<ReportCubit>(context)
                  .send(item: item, price: price);
            },
            child: Card(
              elevation: 0,
              child: Container(
                width: EsaySize.width(context),
                height: 42,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
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
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          )),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(Assets.icons.send,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).iconTheme.color!,
                                BlendMode.srcIn,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
