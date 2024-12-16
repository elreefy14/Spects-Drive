// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../providers/files_entries_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileEntriesHash() => r'4c591903279809592ef1ba163b92b70bf70c46ba';

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

abstract class _$FileEntries
    extends BuildlessAutoDisposeAsyncNotifier<PaginatedFileEntries> {
  late final DrivePaginationParams params;

  FutureOr<PaginatedFileEntries> build(
    DrivePaginationParams params,
  );
}

/// See also [FileEntries].
@ProviderFor(FileEntries)
const fileEntriesProvider = FileEntriesFamily();

/// See also [FileEntries].
class FileEntriesFamily extends Family<AsyncValue<PaginatedFileEntries>> {
  /// See also [FileEntries].
  const FileEntriesFamily();

  /// See also [FileEntries].
  FileEntriesProvider call(
    DrivePaginationParams params,
  ) {
    return FileEntriesProvider(
      params,
    );
  }

  @override
  FileEntriesProvider getProviderOverride(
    covariant FileEntriesProvider provider,
  ) {
    return call(
      provider.params,
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
  String? get name => r'fileEntriesProvider';
}

/// See also [FileEntries].
class FileEntriesProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FileEntries, PaginatedFileEntries> {
  /// See also [FileEntries].
  FileEntriesProvider(
    DrivePaginationParams params,
  ) : this._internal(
          () => FileEntries()..params = params,
          from: fileEntriesProvider,
          name: r'fileEntriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fileEntriesHash,
          dependencies: FileEntriesFamily._dependencies,
          allTransitiveDependencies:
              FileEntriesFamily._allTransitiveDependencies,
          params: params,
        );

  FileEntriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final DrivePaginationParams params;

  @override
  FutureOr<PaginatedFileEntries> runNotifierBuild(
    covariant FileEntries notifier,
  ) {
    return notifier.build(
      params,
    );
  }

  @override
  Override overrideWith(FileEntries Function() create) {
    return ProviderOverride(
      origin: this,
      override: FileEntriesProvider._internal(
        () => create()..params = params,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FileEntries, PaginatedFileEntries>
      createElement() {
    return _FileEntriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FileEntriesProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FileEntriesRef
    on AutoDisposeAsyncNotifierProviderRef<PaginatedFileEntries> {
  /// The parameter `params` of this provider.
  DrivePaginationParams get params;
}

class _FileEntriesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FileEntries,
        PaginatedFileEntries> with FileEntriesRef {
  _FileEntriesProviderElement(super.provider);

  @override
  DrivePaginationParams get params => (origin as FileEntriesProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
