import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../bootstrap/preferences_provider.dart';

part '../.generated/drive/drive_state_provider.freezed.dart';
part '../.generated/drive/drive_state_provider.g.dart';

enum DriveViewMode { list, grid }

enum DriveMode { drive, destinationPicker }

@Riverpod(keepAlive: true)
class DriveState extends _$DriveState {
  setActiveFolderId(int? folderId) {
    state = state.copyWith(activeFolderId: folderId);
  }

  setDriveMode(DriveMode mode) {
    state = state.copyWith(driveMode: mode);
  }

  setThemeMode(ThemeMode mode) {
    ref.read(preferencesProvider).requireValue.set('themeMode', mode.name);
    state = state.copyWith(activeThemeMode: mode);
  }

  setViewMode(DriveViewMode mode) {
    ref.read(preferencesProvider).requireValue.set('driveViewMode', mode.name);
    state = state.copyWith(activeViewMode: mode);
  }

  toggleEntry(int entryId) {
    final selectedEntries = state.selectedEntries;
    final newEntryIds = selectedEntries.contains(entryId)
        ? selectedEntries.where((id) => id != entryId).toList()
        : [...selectedEntries, entryId];
    state = state.copyWith(selectedEntries: newEntryIds);
  }

  selectMultipleEntries(List<int> entryIds) {
    state = state.copyWith(selectedEntries: entryIds);
  }

  deselectAllEntries() {
    state = state.copyWith(selectedEntries: []);
  }

  syncStateWithRouter({
    required DriveMode driveMode,
    required int? activeFolderId,
  }) {
    if (driveMode != state.driveMode ||
        activeFolderId != state.activeFolderId) {
      state = state.copyWith(
        driveMode: driveMode,
        activeFolderId: activeFolderId,
      );
    }
  }

  @override
  DriveStateValue build() {
    final preferences = ref.watch(preferencesProvider).requireValue;

    final themeMode = switch (preferences.get('themeMode')) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };

    final viewMode = switch (preferences.get('driveViewMode')) {
      'grid' => DriveViewMode.grid,
      _ => DriveViewMode.list,
    };

    return DriveStateValue(
      selectedEntries: [],
      activeViewMode: viewMode,
      activeThemeMode: themeMode,
      driveMode: DriveMode.drive,
      activeFolderId: null,
    );
  }
}

@sealed
@freezed
class DriveStateValue with _$DriveStateValue {
  const DriveStateValue._();

  const factory DriveStateValue({
    required List<int> selectedEntries,
    required DriveViewMode activeViewMode,
    required ThemeMode activeThemeMode,
    required DriveMode driveMode,
    required int? activeFolderId,
  }) = _DriveStateValue;
}
