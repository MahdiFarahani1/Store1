/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow_back.png
  AssetGenImage get arrowBack =>
      const AssetGenImage('assets/images/arrow_back.png');

  /// File path: assets/images/arrow_down.png
  AssetGenImage get arrowDown =>
      const AssetGenImage('assets/images/arrow_down.png');

  /// File path: assets/images/bgSplash.jpg
  AssetGenImage get bgSplash =>
      const AssetGenImage('assets/images/bgSplash.jpg');

  /// File path: assets/images/centerSplash.png
  AssetGenImage get centerSplash =>
      const AssetGenImage('assets/images/centerSplash.png');

  /// File path: assets/images/darkmode.png
  AssetGenImage get darkmode =>
      const AssetGenImage('assets/images/darkmode.png');

  /// File path: assets/images/date.png
  AssetGenImage get date => const AssetGenImage('assets/images/date.png');

  /// File path: assets/images/exit.png
  AssetGenImage get exit => const AssetGenImage('assets/images/exit.png');

  /// File path: assets/images/fontsize.png
  AssetGenImage get fontsize =>
      const AssetGenImage('assets/images/fontsize.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/image.png
  AssetGenImage get image => const AssetGenImage('assets/images/image.png');

  /// File path: assets/images/info.png
  AssetGenImage get info => const AssetGenImage('assets/images/info.png');

  /// File path: assets/images/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/images/menu.png');

  /// File path: assets/images/mic-disabled.png
  AssetGenImage get micDisabled =>
      const AssetGenImage('assets/images/mic-disabled.png');

  /// File path: assets/images/mic.png
  AssetGenImage get mic => const AssetGenImage('assets/images/mic.png');

  /// File path: assets/images/notif.png
  AssetGenImage get notif => const AssetGenImage('assets/images/notif.png');

  /// File path: assets/images/report.png
  AssetGenImage get report => const AssetGenImage('assets/images/report.png');

  /// File path: assets/images/searchIcon.png
  AssetGenImage get searchIcon =>
      const AssetGenImage('assets/images/searchIcon.png');

  /// File path: assets/images/send.png
  AssetGenImage get send => const AssetGenImage('assets/images/send.png');

  /// File path: assets/images/settings.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/images/settings.png');

  /// File path: assets/images/test1.jpg
  AssetGenImage get test1 => const AssetGenImage('assets/images/test1.jpg');

  /// File path: assets/images/test2.jpg
  AssetGenImage get test2 => const AssetGenImage('assets/images/test2.jpg');

  /// File path: assets/images/test3.jpg
  AssetGenImage get test3 => const AssetGenImage('assets/images/test3.jpg');

  /// File path: assets/images/test4.jpg
  AssetGenImage get test4 => const AssetGenImage('assets/images/test4.jpg');

  /// File path: assets/images/test5.jpg
  AssetGenImage get test5 => const AssetGenImage('assets/images/test5.jpg');

  /// File path: assets/images/test6.jpg
  AssetGenImage get test6 => const AssetGenImage('assets/images/test6.jpg');

  /// File path: assets/images/test7.jpg
  AssetGenImage get test7 => const AssetGenImage('assets/images/test7.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        arrowBack,
        arrowDown,
        bgSplash,
        centerSplash,
        darkmode,
        date,
        exit,
        fontsize,
        home,
        image,
        info,
        menu,
        micDisabled,
        mic,
        notif,
        report,
        searchIcon,
        send,
        settings,
        test1,
        test2,
        test3,
        test4,
        test5,
        test6,
        test7
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/gifSetting.gif
  AssetGenImage get gifSetting =>
      const AssetGenImage('assets/lottie/gifSetting.gif');

  /// List of all assets
  List<AssetGenImage> get values => [gifSetting];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
