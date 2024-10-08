import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config/theme/theme_cubit.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  double _fontSize = 14.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            EsaySize.gap(25),
            _buildSectionTitle('الوضع الليلي', Assets.icons.moon, w: 20, h: 20),
            _buildDarkModeOption(),
            EsaySize.gap(8),
            const Divider(),
            EsaySize.gap(8),
            _buildSectionTitle('حجم الخط', Assets.icons.exchange, w: 23, h: 23),
            EsaySize.gap(10),
            _buildFontSizeSlider(),
            EsaySize.gap(8),
            const Divider(),
            EsaySize.gap(8),
            _buildSectionTitle('الاشعارات', Assets.icons.notification,
                w: 20, h: 20),
            _buildNotificationSwitch(),
            EsaySize.gap(8),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String imageVal,
      {double? w, double? h}) {
    return Row(
      children: [
        SvgPicture.asset(imageVal,
            width: w,
            height: h,
            colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!,
              BlendMode.srcIn,
            )),
        EsaySize.gap(8),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: ConstColor.getBgReverce(context),
          ),
        ),
      ],
    );
  }

  Widget _buildDarkModeOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'داكن',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Transform.scale(
              scale: 0.8,
              child: Switch(
                value: state.isDark,
                onChanged: (value) {
                  BlocProvider.of<ThemeCubit>(context).chengeTheme(value);
                },
                activeColor: Theme.of(context).iconTheme.color!,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFontSizeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الحجم: ${_fontSize.toStringAsFixed(0)}',
          style: TextStyle(fontSize: _fontSize, color: Colors.black54),
        ),
        SliderTheme(
          data: const SliderThemeData(
              trackHeight: 3,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6)),
          child: Slider(
            value: _fontSize,
            min: 12.0,
            max: 24.0,
            divisions: 6,
            label: _fontSize.toStringAsFixed(0),
            activeColor: Theme.of(context).iconTheme.color!,
            inactiveColor: Colors.grey[300],
            onChanged: (double newSize) {
              setState(() {
                _fontSize = newSize;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'تفعيل عرض الاشعارات',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
        Transform.scale(
          scale: 0.75,
          child: ElevatedButton(
            onPressed: () {
              AppSettings.openAppSettings(type: AppSettingsType.notification);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: ConstColor.getIconColor(context)),
            child: const Text(
              "حالة",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Center(
        child: Image.asset(
      Assets.lottie.gifSetting.path,
      width: 50,
      height: 50,
    ));
  }
}
