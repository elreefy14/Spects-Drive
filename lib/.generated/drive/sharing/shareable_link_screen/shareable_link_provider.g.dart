// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../drive/sharing/shareable_link_screen/shareable_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shareableLinkControllerHash() =>
    r'894a9976af13e9b558c40420dca0af42a2d4c948';

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

abstract class _$ShareableLinkController
    extends BuildlessAutoDisposeAsyncNotifier<ShareableLinkState> {
  late final int entryId;

  FutureOr<ShareableLinkState> build(
    int entryId,
  );
}

/// See also [ShareableLinkController].
@ProviderFor(ShareableLinkController)
const shareableLinkControllerProvider = ShareableLinkControllerFamily();

/// See also [ShareableLinkController].
class ShareableLinkControllerFamily
    extends Family<AsyncValue<ShareableLinkState>> {
  /// See also [ShareableLinkController].
  const ShareableLinkControllerFamily();

  /// See also [ShareableLinkController].
  ShareableLinkControllerProvider call(
    int entryId,
  ) {
    return ShareableLinkControllerProvider(
      entryId,
    );
  }

  @override
  ShareableLinkControllerProvider getProviderOverride(
    covariant ShareableLinkControllerProvider provider,
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
  String? get name => r'shareableLinkControllerProvider';
}

/// See also [ShareableLinkController].
class ShareableLinkControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ShareableLinkController,
        ShareableLinkState> {
  /// See also [ShareableLinkController].
  ShareableLinkControllerProvider(
    int entryId,
  ) : this._internal(
          () => ShareableLinkController()..entryId = entryId,
          from: shareableLinkControllerProvider,
          name: r'shareableLinkControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shareableLinkControllerHash,
          dependencies: ShareableLinkControllerFamily._dependencies,
          allTransitiveDependencies:
              ShareableLinkControllerFamily._allTransitiveDependencies,
          entryId: entryId,
        );

  ShareableLinkControllerProvider._internal(
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
  FutureOr<ShareableLinkState> runNotifierBuild(
    covariant ShareableLinkController notifier,
  ) {
    return notifier.build(
      entryId,
    );
  }

  @override
  Override overrideWith(ShareableLinkController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShareableLinkControllerProvider._internal(
        () => create()..entryId = entryId,
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
  AutoDisposeAsyncNotifierProviderElement<ShareableLinkController,
      ShareableLinkState> createElement() {
    return _ShareableLinkControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShareableLinkControllerProvider && other.entryId == entryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, entryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShareableLinkControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ShareableLinkState> {
  /// The parameter `entryId` of this provider.
  int get entryId;
}

class _ShareableLinkControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ShareableLinkController,
        ShareableLinkState> with ShareableLinkControllerRef {
  _ShareableLinkControllerProviderElement(super.provider);

  @override
  int get entryId => (origin as ShareableLinkControllerProvider).entryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
