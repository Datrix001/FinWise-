// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsColorsGen {
  const $AssetsColorsGen();

  /// File path: assets/colors/colors.xml
  String get colors => 'assets/colors/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/NotoSans-ExtraLight.ttf
  String get notoSansExtraLight => 'assets/fonts/NotoSans-ExtraLight.ttf';

  /// File path: assets/fonts/NotoSans-Light.ttf
  String get notoSansLight => 'assets/fonts/NotoSans-Light.ttf';

  /// File path: assets/fonts/NotoSans-SemiBold.ttf
  String get notoSansSemiBold => 'assets/fonts/NotoSans-SemiBold.ttf';

  /// File path: assets/fonts/SourceCodePro-Bold.ttf
  String get sourceCodeProBold => 'assets/fonts/SourceCodePro-Bold.ttf';

  /// File path: assets/fonts/SourceCodePro-Light.ttf
  String get sourceCodeProLight => 'assets/fonts/SourceCodePro-Light.ttf';

  /// File path: assets/fonts/SourceCodePro-SemiBold.ttf
  String get sourceCodeProSemiBold => 'assets/fonts/SourceCodePro-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    notoSansExtraLight,
    notoSansLight,
    notoSansSemiBold,
    sourceCodeProBold,
    sourceCodeProLight,
    sourceCodeProSemiBold,
  ];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/png/filter.png');

  /// File path: assets/png/hide.png
  AssetGenImage get hide => const AssetGenImage('assets/png/hide.png');

  /// File path: assets/png/home.png
  AssetGenImage get home => const AssetGenImage('assets/png/home.png');

  /// File path: assets/png/mail.png
  AssetGenImage get mail => const AssetGenImage('assets/png/mail.png');

  /// File path: assets/png/padlock.png
  AssetGenImage get padlock => const AssetGenImage('assets/png/padlock.png');

  /// File path: assets/png/rupee-symbol.png
  AssetGenImage get rupeeSymbol =>
      const AssetGenImage('assets/png/rupee-symbol.png');

  /// File path: assets/png/setting.png
  AssetGenImage get setting => const AssetGenImage('assets/png/setting.png');

  /// File path: assets/png/user.png
  AssetGenImage get user => const AssetGenImage('assets/png/user.png');

  /// File path: assets/png/users.png
  AssetGenImage get users => const AssetGenImage('assets/png/users.png');

  /// File path: assets/png/view.png
  AssetGenImage get view => const AssetGenImage('assets/png/view.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    filter,
    hide,
    home,
    mail,
    padlock,
    rupeeSymbol,
    setting,
    user,
    users,
    view,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Google.svg
  String get google => 'assets/svg/Google.svg';

  /// List of all assets
  List<String> get values => [google];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsColorsGen colors = $AssetsColorsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<String> get values => [aEnv];
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
