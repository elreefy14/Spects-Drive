// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../drive/preview/locally_stored_file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locallyStoredFileHash() => r'3459d9a2b5e47cb11da968861e25f1a4c54026a3';

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

/// See also [locallyStoredFile].
@ProviderFor(locallyStoredFile)
const locallyStoredFileProvider = LocallyStoredFileFamily();

/// See also [locallyStoredFile].
class LocallyStoredFileFamily
    extends Family<AsyncValue<LocallyStoredFileResult>> {
  /// See also [locallyStoredFile].
  const LocallyStoredFileFamily();

  /// See also [locallyStoredFile].
  LocallyStoredFileProvider call(
    StableFileEntry entry, {
    bool download = false,
  }) {
    return LocallyStoredFileProvider(
      entry,
      download: download,
    );
  }

  @override
  LocallyStoredFileProvider getProviderOverride(
    covariant LocallyStoredFileProvider provider,
  ) {
    return call(
      provider.entry,
      download: provider.download,
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
  String? get name => r'locallyStoredFileProvider';
}

/// See also [locallyStoredFile].
class LocallyStoredFileProvider
    extends AutoDisposeStreamProvider<LocallyStoredFileResult> {
  /// See also [locallyStoredFile].
  LocallyStoredFileProvider(
    StableFileEntry entry, {
    bool download = false,
  }) : this._internal(
          (ref) => locallyStoredFile(
            ref as LocallyStoredFileRef,
            entry,
            download: download,
          ),
          from: locallyStoredFileProvider,
          name: r'locallyStoredFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locallyStoredFileHash,
          dependencies: LocallyStoredFileFamily._dependencies,
          allTransitiveDependencies:
              LocallyStoredFileFamily._allTransitiveDependencies,
          entry: entry,
          download: download,
        );

  LocallyStoredFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entry,
    required this.download,
  }) : super.internal();

  final StableFileEntry entry;
  final bool download;

  @override
  Override overrideWith(
    Stream<LocallyStoredFileResult> Function(LocallyStoredFileRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocallyStoredFileProvider._internal(
        (ref) => create(ref as LocallyStoredFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entry: entry,
        download: download,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<LocallyStoredFileResult> createElement() {
    return _LocallyStoredFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocallyStoredFileProvider &&
        other.entry == entry &&
        other.download == download;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entry.hashCode);
    hash = _SystemHash.combine(hash, download.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocallyStoredFileRef
    on AutoDisposeStreamProviderRef<LocallyStoredFileResult> {
  /// The parameter `entry` of this provider.
  StableFileEntry get entry;

  /// The parameter `download` of this provider.
  bool get download;
}

class _LocallyStoredFileProviderElement
    extends AutoDisposeStreamProviderElement<LocallyStoredFileResult>
    with LocallyStoredFileRef {
  _LocallyStoredFileProviderElement(super.provider);

  @override
  StableFileEntry get entry => (origin as LocallyStoredFileProvider).entry;
  @override
  bool get download => (origin as LocallyStoredFileProvider).download;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
