import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/const/const_Color.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notificationsEnabled = true;
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
            _buildSectionTitle('الوضع الليلي', Assets.images.darkmode.path,
                w: 27, h: 25),
            _buildDarkModeOption(),
            EsaySize.gap(8),
            const Divider(),
            EsaySize.gap(8),
            _buildSectionTitle('حجم الخط', Assets.images.fontsize.path,
                w: 36, h: 36),
            EsaySize.gap(10),
            _buildFontSizeSlider(),
            EsaySize.gap(8),
            const Divider(),
            EsaySize.gap(8),
            _buildSectionTitle('الاشعارات', Assets.images.notif.path,
                w: 27, h: 25),
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
        Image.asset(
          imageVal,
          width: w,
          height: h,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
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
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: _darkMode,
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },
            activeColor: ConstColor.iconColor,
          ),
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
            activeColor: ConstColor.iconColor,
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
          scale: 0.8,
          child: Switch(
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            activeColor: ConstColor.iconColor,
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