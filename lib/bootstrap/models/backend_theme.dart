import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../.generated/bootstrap/models/backend_theme.freezed.dart';
part '../../.generated/bootstrap/models/backend_theme.g.dart';

enum NavbarColor {
  primary,
  bg,
  bgAlt,
  transparent,
}

@freezed
class BackendTheme with _$BackendTheme {
  const BackendTheme._();

  const factory BackendTheme({
    required int id,
    required String name,
    @JsonKey(name: 'is_dark') required bool isDark,
    @JsonKey(name: 'default_dark') required bool defaultDark,
    @JsonKey(name: 'default_light') required bool defaultLight,
    required BackendThemeColors values,
    String? font,
  }) = _BackendTheme;

  factory BackendTheme.fromJson(Map<String, dynamic> json) =>
      _$BackendThemeFromJson(json);

  factory BackendTheme.fromRawJson(String rawJson) =>
      BackendTheme.fromJson(json.decode(rawJson));

  String toRawJson() => json.encode(toJson());
}

class BackendThemeColors {
  final Color foregroundBase;
  final Color primary;
  final Color primaryLight;
  final Color primaryDark;
  final Color onPrimary;
  final Color background;
  final Color backgroundAlt;
  final Color backgroundChip;
  final Color textMain;
  final Color textMuted;
  final Color divider;
  final double inputRadius;
  final double buttonRadius;
  final double panelRadius;
  final NavbarColor navbarColor;

  BackendThemeColors({
    required this.foregroundBase,
    required this.primary,
    required this.primaryLight,
    required this.primaryDark,
    required this.onPrimary,
    required this.background,
    required this.backgroundAlt,
    required this.backgroundChip,
    required this.textMain,
    required this.textMuted,
    required this.divider,
    required this.buttonRadius,
    required this.inputRadius,
    required this.panelRadius,
    required this.navbarColor,
  });

  factory BackendThemeColors.fromJson(Map<String, dynamic> value) {
    return BackendThemeColors(
      foregroundBase: _colorFromRGB(value['--be-foreground-base']),
      primary: _colorFromRGB(value['--be-primary']),
      primaryLight: _colorFromRGB(value['--be-primary-light']),
      primaryDark: _colorFromRGB(value['--be-primary-dark']),
      onPrimary: _colorFromRGB(value['--be-on-primary']),
      background: _colorFromRGB(value['--be-background']),
      backgroundAlt: _colorFromRGB(value['--be-background-alt']),
      backgroundChip: _colorFromRGB(value['--be-background-chip']),
      textMain: _colorFromRGB(
          value['--be-foreground-base'], value['--be-text-main-opacity'] / 100),
      textMuted: _colorFromRGB(value['--be-foreground-base'],
          value['--be-text-muted-opacity'] / 100),
      divider: _colorFromRGB(
          value['--be-foreground-base'], value['--be-divider-opacity'] / 100),
      buttonRadius: (value['--be-button-radius'] ?? 4).toDouble(),
      inputRadius: (value['--be-input-radius'] ?? 4).toDouble(),
      panelRadius: (value['--be-panel-radius'] ?? 4).toDouble(),
      navbarColor: switch (value['--be-navbar-color']) {
        'primary' => NavbarColor.primary,
        'bg-alt' => NavbarColor.bgAlt,
        'transparent' => NavbarColor.transparent,
        _ => NavbarColor.bg,
      },
    );
  }

  Map<String, dynamic> toJson() => {
        '--be-foreground-base': foregroundBase.value,
        '--be-primary': primary.value,
        '--be-primary-light': primaryLight.value,
        '--be-primary-dark': primaryDark.value,
        '--be-on-primary': onPrimary.value,
        '--be-background': background.value,
        '--be-background-alt': backgroundAlt.value,
        '--be-background-chip': backgroundChip.value,
        '--be-text-main-opacity': textMain.opacity * 100,
        '--be-text-muted-opacity': textMuted.opacity * 100,
        '--be-divider-opacity': divider.opacity * 100,
      };
}

Color _colorFromRGB(List<dynamic> rgb, [double opacity = 1]) {
  return Color.fromRGBO(rgb[0], rgb[1], rgb[2], opacity);
}
