import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config/save/save_All.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';
import 'package:flutter_application_1/Core/widgets/backBtn.dart';
import 'package:flutter_application_1/Features/contentCards/repositories/print/repository_pirint.dart';
import 'package:flutter_application_1/Features/contentCards/view/bloc/pirint/pirint_cubit.dart';
import 'package:flutter_application_1/Features/contentCards/view/bloc/pirint/show_devices/show_devices_cubit.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:screenshot/screenshot.dart';

class MyPrintPage extends StatefulWidget {
  const MyPrintPage({super.key});

  @override
  State<MyPrintPage> createState() => _MyPrintPageState();
}

class _MyPrintPageState extends State<MyPrintPage>
    with SingleTickerProviderStateMixin {
  int? connectedIndex;

  late bool connectionStatus;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PirintCubit>(context).fetchBluetoothDevices();
    RepositoryPirint.autoConnectInit();
  }

  Future<void> contentPrinter() async {
    bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    context.read<ShowDevicesCubit>().changeState(connectionStatus);
    if (connectionStatus) {
      List<int> ticket = await RepositoryPirint.testTicket();
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      if (kDebugMode) {
        print("Print result: $result");
      }
    } else {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              backgroundColor: ConstColor.getBgMain(context),
              title: const Text('لم يتم الاقتران!',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: const Text(
                  'يرجى الانتقال الى الاعدادات والاتصال بالطابعة المطلوبة، هل تريد القيام بذلك؟'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('لا', style: TextStyle(color: Colors.red)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    AppSettings.openAppSettings(
                        type: AppSettingsType.bluetooth);
                  },
                  child:
                      const Text('نعم', style: TextStyle(color: Colors.blue)),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },
      );
      if (kDebugMode) {
        print("Printer not connected");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: BackBtn(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            context
                                .read<ShowDevicesCubit>()
                                .changeStaticState();
                          },
                          child: SvgPicture.asset(
                            Assets.icons.bluetooth,
                            colorFilter: ColorFilter.mode(
                                ConstColor.getBgReverce(context),
                                BlendMode.srcIn),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Transform.scale(
                    scaleX: 1.5,
                    scaleY: 1.3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: ConstColor.getBgReverce(context),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: ConstColor.getBgMain(context),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.images.topPrint.path,
                            width: 50,
                            height: 50,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 150,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                    ),
                                    top: BorderSide(color: Colors.black))),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 6, top: 3),
                              child: Screenshot(
                                controller:
                                    RepositoryPirint.screenshotControllerHeader,
                                child: const Text(
                                  'علی الساعدی',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                          EsaySize.gap(8),
                          const Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Terminal ID: 424',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 7),
                                ),
                                Text(
                                  'Time: 2024 - 10 - 21  15:22:30',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 7),
                                ),
                                Text(
                                  'Order Number: 63704932',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: 80,
                            height: 50,
                            child: Image.asset(
                              Assets.images.centerPrint.path,
                            ),
                          ),
                          const Text(
                            'iTunes 25\$',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 9),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 35, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SN: 9826475501264537',
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'PIN Code:',
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '7326598712042857',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Text('__________________'),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Screenshot(
                              controller:
                                  RepositoryPirint.screenshotControllerFooter,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 130,
                                    child: Text(
                                      textDirection: TextDirection.rtl,
                                      '١- لتعبئة الإنترنت: *233* ثم رقم البطاقة ثم # ثم اتصال',
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Text(
                                      textDirection: TextDirection.rtl,
                                      '٢- لتعبئة الرصيد: *133* ثم رقم البطاقة ثم # ثم اتصال',
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Text(
                                      textDirection: TextDirection.rtl,
                                      '٣- البطاقات متوفّرة في مراكز آسياسيل ونقاط البيع الرئيسية',
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Text(
                                      textDirection: TextDirection.rtl,
                                      '٤- أن الإستخدام المجاني لـمواقع التواصل الإجتماعي لا يشمل مكالمات الفيديو والمكالمات الصوتية لباقات السرعة (فري سوشيال+)، ويتم إحتسابها من رصيد الإنترنت الأساسي.',
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                EsaySize.gap(8),
                BlocBuilder<PirintCubit, PirintState>(
                  builder: (context, state) {
                    if (state.bluetoothDevices.isEmpty) {
                      return CustomLoading.loadLine(context);
                    } else {
                      return BlocBuilder<ShowDevicesCubit, bool>(
                        builder: (context, offstageState) {
                          return Offstage(
                            offstage: offstageState,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<PirintCubit>(context)
                                        .catchNewDevice();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ConstColor.getBgMain(context),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: SvgPicture.asset(
                                      Assets.icons.refresh,
                                      colorFilter: ColorFilter.mode(
                                          ConstColor.lightIconColor,
                                          BlendMode.srcIn),
                                    ),
                                  ),
                                ),
                                StatefulBuilder(builder: (context, setStateBg) {
                                  return ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.bluetoothDevices.length,
                                    itemBuilder: (context, index) {
                                      final device =
                                          state.bluetoothDevices[index];
                                      return AnimatedContainer(
                                        margin: const EdgeInsets.all(4),
                                        duration: const Duration(seconds: 1),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: connectedIndex == index
                                              ? Colors.green.shade300
                                              : Colors.white,
                                        ),
                                        child: ListTile(
                                          leading: SvgPicture.asset(
                                            Assets.icons.bluetooth,
                                            colorFilter: ColorFilter.mode(
                                                ConstColor.lightIconColor,
                                                BlendMode.srcIn),
                                          ),
                                          title: Text(device.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          subtitle: Text(device.macAdress),
                                          onTap: () async {
                                            try {
                                              connectionStatus =
                                                  await PrintBluetoothThermal
                                                      .connectionStatus;
                                              await PrintBluetoothThermal
                                                  .connect(
                                                      macPrinterAddress:
                                                          device.macAdress);
                                              SaveAll.saveDevice.write(
                                                  'saveDevice',
                                                  device.macAdress);

                                              setStateBg(
                                                () => connectedIndex = index,
                                              );
                                              if (kDebugMode) {
                                                print("Connected");
                                              }
                                            } catch (e) {
                                              if (kDebugMode) {
                                                print("Error: $e");
                                              }
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstColor.getBgMain(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                  ),
                  onPressed: () async {
                    await RepositoryPirint.convertWidgetToImage();
                    await contentPrinter();
                  },
                  child: Text(
                    'طباعة',
                    style: TextStyle(
                      color: ConstColor.getBgReverce(context),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
