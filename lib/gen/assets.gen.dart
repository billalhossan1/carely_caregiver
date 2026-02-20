// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Satoshi-Black.otf
  String get satoshiBlack => 'assets/fonts/Satoshi-Black.otf';

  /// File path: assets/fonts/Satoshi-Bold.otf
  String get satoshiBold => 'assets/fonts/Satoshi-Bold.otf';

  /// File path: assets/fonts/Satoshi-Italic.otf
  String get satoshiItalic => 'assets/fonts/Satoshi-Italic.otf';

  /// File path: assets/fonts/Satoshi-Light.otf
  String get satoshiLight => 'assets/fonts/Satoshi-Light.otf';

  /// File path: assets/fonts/Satoshi-Medium.otf
  String get satoshiMedium => 'assets/fonts/Satoshi-Medium.otf';

  /// File path: assets/fonts/Satoshi-Regular.otf
  String get satoshiRegular => 'assets/fonts/Satoshi-Regular.otf';

  /// List of all assets
  List<String> get values => [
    satoshiBlack,
    satoshiBold,
    satoshiItalic,
    satoshiLight,
    satoshiMedium,
    satoshiRegular,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/caregiver.svg
  String get caregiver => 'assets/icons/caregiver.svg';

  /// File path: assets/icons/client.svg
  String get client => 'assets/icons/client.svg';

  /// File path: assets/icons/google.svg
  String get google => 'assets/icons/google.svg';

  /// List of all assets
  List<String> get values => [caregiver, client, google];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [img, onboarding1, onboarding2, splashBg];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/app_logo.png
  AssetGenImage get appLogoPng =>
      const AssetGenImage('assets/logo/app_logo.png');

  /// File path: assets/logo/app_logo.svg
  String get appLogoSvg => 'assets/logo/app_logo.svg';

  /// File path: assets/logo/app_logo2.png
  AssetGenImage get appLogo2 =>
      const AssetGenImage('assets/logo/app_logo2.png');

  /// List of all assets
  List<dynamic> get values => [appLogoPng, appLogoSvg, appLogo2];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
