import 'package:bedrive/bootstrap/models/backend_theme.dart';
import 'package:flutter/material.dart';

class AppThemeData extends ThemeExtension<AppThemeData> {
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

  const AppThemeData({
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
    required this.inputRadius,
    required this.buttonRadius,
    required this.panelRadius,
    required this.navbarColor,
  });

  @override
  AppThemeData copyWith({
    Color? foregroundBase,
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? onPrimary,
    Color? background,
    Color? backgroundAlt,
    Color? backgroundChip,
    Color? textMain,
    Color? textMuted,
    Color? divider,
    double? inputRadius,
    double? buttonRadius,
    double? panelRadius,
    NavbarColor? navbarColor,
  }) {
    return AppThemeData(
      foregroundBase: foregroundBase ?? this.foregroundBase,
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      onPrimary: onPrimary ?? this.onPrimary,
      background: background ?? this.background,
      backgroundAlt: backgroundAlt ?? this.backgroundAlt,
      backgroundChip: backgroundChip ?? this.backgroundChip,
      textMain: textMain ?? this.textMain,
      textMuted: textMuted ?? this.textMuted,
      divider: divider ?? this.divider,
      inputRadius: inputRadius ?? this.inputRadius,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      panelRadius: panelRadius ?? this.panelRadius,
      navbarColor: navbarColor ?? this.navbarColor,
    );
  }

  @override
  AppThemeData lerp(AppThemeData? other, double t) {
    if (other is! AppThemeData) {
      return this;
    }
    return AppThemeData(
      foregroundBase: Color.lerp(foregroundBase, other.foregroundBase, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundAlt: Color.lerp(backgroundAlt, other.backgroundAlt, t)!,
      backgroundChip: Color.lerp(backgroundChip, other.backgroundChip, t)!,
      textMain: Color.lerp(textMain, other.textMain, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      inputRadius: inputRadius,
      buttonRadius: buttonRadius,
      panelRadius: panelRadius,
      navbarColor: navbarColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppThemeData &&
        other.foregroundBase == foregroundBase &&
        other.primary == primary &&
        other.primaryLight == primaryLight &&
        other.primaryDark == primaryDark &&
        other.onPrimary == onPrimary &&
        other.background == background &&
        other.backgroundAlt == backgroundAlt &&
        other.backgroundChip == backgroundChip &&
        other.textMain == textMain &&
        other.textMuted == textMuted &&
        other.divider == divider &&
        other.inputRadius == inputRadius &&
        other.buttonRadius == buttonRadius &&
        other.panelRadius == panelRadius &&
        other.navbarColor == navbarColor;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      foregroundBase,
      primary,
      primaryLight,
      primaryDark,
      onPrimary,
      background,
      backgroundAlt,
      backgroundChip,
      textMain,
      textMuted,
      divider,
      inputRadius,
      buttonRadius,
      panelRadius,
      navbarColor,
    );
  }
}
