/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back_button.svg
  String get backButton => 'assets/icons/back_button.svg';

  /// File path: assets/icons/brunch_dining.svg
  String get brunchDining => 'assets/icons/brunch_dining.svg';

  /// File path: assets/icons/calendar_month.svg
  String get calendarMonth => 'assets/icons/calendar_month.svg';

  /// File path: assets/icons/chat_bubble.svg
  String get chatBubble => 'assets/icons/chat_bubble.svg';

  /// File path: assets/icons/comedy_mask.svg
  String get comedyMask => 'assets/icons/comedy_mask.svg';

  /// File path: assets/icons/event_dashboard.svg
  String get eventDashboard => 'assets/icons/event_dashboard.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/india_gate.svg
  String get indiaGate => 'assets/icons/india_gate.svg';

  /// File path: assets/icons/interests.svg
  String get interests => 'assets/icons/interests.svg';

  /// File path: assets/icons/local_cafe.svg
  String get localCafe => 'assets/icons/local_cafe.svg';

  /// File path: assets/icons/location_on.svg
  String get locationOn => 'assets/icons/location_on.svg';

  /// File path: assets/icons/music_note.svg
  String get musicNote => 'assets/icons/music_note.svg';

  /// File path: assets/icons/nightlife.svg
  String get nightlife => 'assets/icons/nightlife.svg';

  /// File path: assets/icons/person.svg
  String get person => 'assets/icons/person.svg';

  /// File path: assets/icons/record_mic.svg
  String get recordMic => 'assets/icons/record_mic.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/sports_basketball.svg
  String get sportsBasketball => 'assets/icons/sports_basketball.svg';

  /// List of all assets
  List<String> get values => [
        backButton,
        brunchDining,
        calendarMonth,
        chatBubble,
        comedyMask,
        eventDashboard,
        home,
        indiaGate,
        interests,
        localCafe,
        locationOn,
        musicNote,
        nightlife,
        person,
        recordMic,
        search,
        sportsBasketball
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/person_profile.png
  AssetGenImage get personProfile =>
      const AssetGenImage('assets/images/person_profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [personProfile];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
