import 'package:bedrive/bootstrap/models/backend_theme.dart';
import 'package:bedrive/drive/drive_state_provider.dart';
import 'package:bedrive/ui/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../bootstrap/bootstrap_data_provider.dart';

part '../.generated/ui/app_theme_provider.g.dart';

@Riverpod(keepAlive: true)
Future<({ThemeData dark, ThemeData light, ThemeMode selectedTheme})> appTheme(
  AppThemeRef ref,
) async {
  final bootstrapData = ref.watch(bootstrapDataProvider).requireValue;

  final lightTheme = buildTheme(bootstrapData.themes['light']!);
  final darkTheme = buildTheme(bootstrapData.themes['dark']!);

  final selectedTheme =
      ref.watch(driveStateProvider.select((s) => s.activeThemeMode));

  return (
    light: lightTheme,
    dark: darkTheme,
    selectedTheme: selectedTheme,
  );
}

ThemeData buildTheme(BackendTheme theme) {
  final appThemeData = AppThemeData(
    foregroundBase: theme.values.foregroundBase,
    primary: theme.values.primary,
    primaryLight: theme.values.primaryLight,
    primaryDark: theme.values.primaryDark,
    onPrimary: theme.values.onPrimary,
    background: theme.values.background,
    backgroundAlt: theme.values.backgroundAlt,
    backgroundChip: theme.values.backgroundChip,
    textMain: theme.values.textMain,
    textMuted: theme.values.textMuted,
    divider: theme.values.divider,
    inputRadius: theme.values.inputRadius,
    buttonRadius: theme.values.buttonRadius,
    panelRadius: theme.values.panelRadius,
    navbarColor: theme.values.navbarColor,
  );

  final inputTheme = OutlineInputBorder(
    borderSide: BorderSide(color: appThemeData.divider, width: 1),
    borderRadius: BorderRadius.all(
      Radius.circular(appThemeData.inputRadius),
    ),
  );

  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[appThemeData],
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: appThemeData.primary,
      primary: appThemeData.primary,
      onPrimary: appThemeData.onPrimary,
      background: appThemeData.background,
      surface: appThemeData.backgroundAlt,
      onBackground: appThemeData.textMain,
      onSurface: appThemeData.textMain,
      onSurfaceVariant: appThemeData.textMuted,
      brightness: theme.isDark ? Brightness.dark : Brightness.light,
    ),
    brightness: theme.isDark ? Brightness.dark : Brightness.light,
    canvasColor: appThemeData.background,
    dividerColor: appThemeData.divider,
    scaffoldBackgroundColor: appThemeData.background,
    primaryColor: appThemeData.primary,
    primaryColorLight: appThemeData.primaryLight,
    primaryColorDark: appThemeData.primaryDark,
    textTheme: const TextTheme().apply(
      bodyColor: appThemeData.textMain,
      displayColor: appThemeData.textMuted,
    ),
    primaryTextTheme: const TextTheme().apply(
      bodyColor: appThemeData.onPrimary,
      displayColor: appThemeData.onPrimary,
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      foregroundColor: switch (appThemeData.navbarColor) {
        NavbarColor.primary => appThemeData.onPrimary,
        _ => null,
      },
      backgroundColor: switch (appThemeData.navbarColor) {
        NavbarColor.primary => appThemeData.primary,
        NavbarColor.bgAlt => appThemeData.backgroundAlt,
        NavbarColor.transparent => Colors.transparent,
        _ => appThemeData.background,
      },
    ),
    cardTheme: CardTheme(
      surfaceTintColor: Colors.transparent,
      color: appThemeData.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appThemeData.panelRadius),
      ),
    ),
    drawerTheme: DrawerThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: appThemeData.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(appThemeData.panelRadius),
          bottomRight: Radius.circular(appThemeData.panelRadius),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: appThemeData.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appThemeData.panelRadius),
      ),
    ),
    menuTheme: MenuThemeData(
      style: MenuStyle(
          surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(appThemeData.background),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(appThemeData.panelRadius),
            ),
          )),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(appThemeData.textMain),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appThemeData.buttonRadius),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: appThemeData.divider,
            width: 1,
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appThemeData.buttonRadius),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: appThemeData.textMain,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appThemeData.buttonRadius),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: appThemeData.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(appThemeData.buttonRadius),
        ),
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: appThemeData.background,
      selectedTileColor: appThemeData.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appThemeData.panelRadius),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: Colors.transparent,
      color: appThemeData.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appThemeData.panelRadius),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: inputTheme,
      focusedBorder: inputTheme.copyWith(
        borderSide: BorderSide(color: appThemeData.primary, width: 1),
      ),
      border: inputTheme,
      filled: true,
      fillColor: appThemeData.background,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      isDense: true,
      errorMaxLines: 2,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: appThemeData.backgroundChip,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appThemeData.buttonRadius),
      ),
    ),
    dialogBackgroundColor: appThemeData.background,
    dialogTheme: DialogTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: appThemeData.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appThemeData.panelRadius),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: appThemeData.primary,
      selectionColor: appThemeData.primaryLight,
      selectionHandleColor: appThemeData.primary,
    ),
    hintColor: appThemeData.textMuted,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: appThemeData.primary,
      linearTrackColor: appThemeData.primaryLight,
      circularTrackColor: appThemeData.primaryLight,
    ),
    iconTheme: IconThemeData(
      color: appThemeData.textMuted,
    ),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
