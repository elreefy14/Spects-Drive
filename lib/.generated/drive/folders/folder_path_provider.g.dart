// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../drive/folders/folder_path_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$folderPathHash() => r'75d12cbba6d54b58917a4681339354136791dba0';

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

/// See also [folderPath].
@ProviderFor(folderPath)
const folderPathProvider = FolderPathFamily();

/// See also [folderPath].
class FolderPathFamily extends Family<AsyncValue<List<FileEntry>>> {
  /// See also [folderPath].
  const FolderPathFamily();

  /// See also [folderPath].
  FolderPathProvider call(
    String folderId,
  ) {
    return FolderPathProvider(
      folderId,
    );
  }

  @override
  FolderPathProvider getProviderOverride(
    covariant FolderPathProvider provider,
  ) {
    return call(
      provider.folderId,
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
  String? get name => r'folderPathProvider';
}

/// See also [folderPath].
class FolderPathProvider extends AutoDisposeFutureProvider<List<FileEntry>> {
  /// See also [folderPath].
  FolderPathProvider(
    String folderId,
  ) : this._internal(
          (ref) => folderPath(
            ref as FolderPathRef,
            folderId,
          ),
          from: folderPathProvider,
          name: r'folderPathProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$folderPathHash,
          dependencies: FolderPathFamily._dependencies,
          allTransitiveDependencies:
              FolderPathFamily._allTransitiveDependencies,
          folderId: folderId,
        );

  FolderPathProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.folderId,
  }) : super.internal();

  final String folderId;

  @override
  Override overrideWith(
    FutureOr<List<FileEntry>> Function(FolderPathRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FolderPathProvider._internal(
        (ref) => create(ref as FolderPathRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        folderId: folderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<FileEntry>> createElement() {
    return _FolderPathProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FolderPathProvider && other.folderId == folderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, folderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FolderPathRef on AutoDisposeFutureProviderRef<List<FileEntry>> {
  /// The parameter `folderId` of this provider.
  String get folderId;
}

class _FolderPathProviderElement
    extends AutoDisposeFutureProviderElement<List<FileEntry>>
    with FolderPathRef {
  _FolderPathProviderElement(super.provider);

  @override
  String get folderId => (origin as FolderPathProvider).folderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
