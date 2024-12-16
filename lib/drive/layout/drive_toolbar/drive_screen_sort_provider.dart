import 'package:bedrive/bootstrap/preferences_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../.generated/drive/layout/drive_toolbar/drive_screen_sort_provider.freezed.dart';
part '../../../.generated/drive/layout/drive_toolbar/drive_screen_sort_provider.g.dart';

enum DriveSortColumn {
  fileSize('Size'),
  updatedAt('Last modified'),
  createdAt('Upload date'),
  type('Type'),
  extension('Extension'),
  name('Name');

  final String label;

  const DriveSortColumn(this.label);
}

enum DriveSortDirection {
  asc('Ascending'),
  desc('Descending');

  final String label;

  const DriveSortDirection(this.label);
}

@freezed
class SortDescriptor with _$SortDescriptor {
  const SortDescriptor._();

  const factory SortDescriptor({
    required DriveSortColumn column,
    required DriveSortDirection direction,
  }) = _SortDescriptor;

  @override
  String toString() {
    return '${column.name}|${direction.name}';
  }
}

@riverpod
class DriveScreenSort extends _$DriveScreenSort {
  changeSort(String uniqueIdentifier, SortDescriptor descriptor) {
    final preferences = ref.read(preferencesProvider).requireValue;
    preferences.set(
      uniqueIdentifier,
      '${descriptor.column.name}|${descriptor.direction.name}',
    );
    state = descriptor;
  }

  @override
  SortDescriptor build(String uniqueIdentifier) {
    final preferences = ref.watch(preferencesProvider).requireValue;
    final descriptor = preferences.get(uniqueIdentifier);

    if (descriptor != null) {
      final parts = descriptor.split('|');
      return SortDescriptor(
        column: DriveSortColumn.values.firstWhere(
          (e) => e.name == parts.elementAtOrNull(0),
          orElse: () => DriveSortColumn.updatedAt,
        ),
        direction: DriveSortDirection.values.firstWhere(
          (e) => e.name == parts.elementAtOrNull(1),
          orElse: () => DriveSortDirection.desc,
        ),
      );
    }

    return const SortDescriptor(
      column: DriveSortColumn.updatedAt,
      direction: DriveSortDirection.desc,
    );
  }
}
