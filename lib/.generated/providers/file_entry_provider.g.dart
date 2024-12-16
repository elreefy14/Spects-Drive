// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../providers/file_entry_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileEntryHash() => r'2f863e211489eb280fa7b8c0f1e4082f6d6a60f9';

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

/// See also [fileEntry].
@ProviderFor(fileEntry)
const fileEntryProvider = FileEntryFamily();

/// See also [fileEntry].
class FileEntryFamily extends Family<AsyncValue<FileEntry>> {
  /// See also [fileEntry].
  const FileEntryFamily();

  /// See also [fileEntry].
  FileEntryProvider call(
    int entryId,
  ) {
    return FileEntryProvider(
      entryId,
    );
  }

  @override
  FileEntryProvider getProviderOverride(
    covariant FileEntryProvider provider,
  ) {
    return call(
      provider.entryId,
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
  String? get name => r'fileEntryProvider';
}

/// See also [fileEntry].
class FileEntryProvider extends AutoDisposeFutureProvider<FileEntry> {
  /// See also [fileEntry].
  FileEntryProvider(
    int entryId,
  ) : this._internal(
          (ref) => fileEntry(
            ref as FileEntryRef,
            entryId,
          ),
          from: fileEntryProvider,
          name: r'fileEntryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fileEntryHash,
          dependencies: FileEntryFamily._dependencies,
          allTransitiveDependencies: FileEntryFamily._allTransitiveDependencies,
          entryId: entryId,
        );

  FileEntryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.entryId,
  }) : super.internal();

  final int entryId;

  @override
  Override overrideWith(
    FutureOr<FileEntry> Function(FileEntryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FileEntryProvider._internal(
        (ref) => create(ref as FileEntryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        entryId: entryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FileEntry> createElement() {
    return _FileEntryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FileEntryProvider && other.entryId == entryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FileEntryRef on AutoDisposeFutureProviderRef<FileEntry> {
  /// The parameter `entryId` of this provider.
  int get entryId;
}

class _FileEntryProviderElement
    extends AutoDisposeFutureProviderElement<FileEntry> with FileEntryRef {
  _FileEntryProviderElement(super.provider);

  @override
  int get entryId => (origin as FileEntryProvider).entryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
