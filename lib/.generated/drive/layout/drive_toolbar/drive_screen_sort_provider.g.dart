// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../drive/layout/drive_toolbar/drive_screen_sort_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$driveScreenSortHash() => r'5466e361cea867d1da58c6c8765053265a66582d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DriveScreenSort
    extends BuildlessAutoDisposeNotifier<SortDescriptor> {
  late final String uniqueIdentifier;

  SortDescriptor build(
    String uniqueIdentifier,
  );
}

/// See also [DriveScreenSort].
@ProviderFor(DriveScreenSort)
const driveScreenSortProvider = DriveScreenSortFamily();

/// See also [DriveScreenSort].
class DriveScreenSortFamily extends Family<SortDescriptor> {
  /// See also [DriveScreenSort].
  const DriveScreenSortFamily();

  /// See also [DriveScreenSort].
  DriveScreenSortProvider call(
    String uniqueIdentifier,
  ) {
    return DriveScreenSortProvider(
      uniqueIdentifier,
    );
  }

  @override
  DriveScreenSortProvider getProviderOverride(
    covariant DriveScreenSortProvider provider,
  ) {
    return call(
      provider.uniqueIdentifier,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'driveScreenSortProvider';
}

/// See also [DriveScreenSort].
class DriveScreenSortProvider
    extends AutoDisposeNotifierProviderImpl<DriveScreenSort, SortDescriptor> {
  /// See also [DriveScreenSort].
  DriveScreenSortProvider(
    String uniqueIdentifier,
  ) : this._internal(
          () => DriveScreenSort()..uniqueIdentifier = uniqueIdentifier,
          from: driveScreenSortProvider,
          name: r'driveScreenSortProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$driveScreenSortHash,
          dependencies: DriveScreenSortFamily._dependencies,
          allTransitiveDependencies:
              DriveScreenSortFamily._allTransitiveDependencies,
          uniqueIdentifier: uniqueIdentifier,
        );

  DriveScreenSortProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uniqueIdentifier,
  }) : super.internal();

  final String uniqueIdentifier;

  @override
  SortDescriptor runNotifierBuild(
    covariant DriveScreenSort notifier,
  ) {
    return notifier.build(
      uniqueIdentifier,
    );
  }

  @override
  Override overrideWith(DriveScreenSort Function() create) {
    return ProviderOverride(
      origin: this,
      override: DriveScreenSortProvider._internal(
        () => create()..uniqueIdentifier = uniqueIdentifier,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uniqueIdentifier: uniqueIdentifier,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DriveScreenSort, SortDescriptor>
      createElement() {
    return _DriveScreenSortProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DriveScreenSortProvider &&
        other.uniqueIdentifier == uniqueIdentifier;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uniqueIdentifier.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DriveScreenSortRef on AutoDisposeNotifierProviderRef<SortDescriptor> {
  /// The parameter `uniqueIdentifier` of this provider.
  String get uniqueIdentifier;
}

class _DriveScreenSortProviderElement
    extends AutoDisposeNotifierProviderElement<DriveScreenSort, SortDescriptor>
    with DriveScreenSortRef {
  _DriveScreenSortProviderElement(super.provider);

  @override
  String get uniqueIdentifier =>
      (origin as DriveScreenSortProvider).uniqueIdentifier;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
