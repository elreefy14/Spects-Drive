// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../drive/layout/drive_drawer/space_usage_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpaceUsageImpl _$$SpaceUsageImplFromJson(Map<String, dynamic> json) =>
    _$SpaceUsageImpl(
      used: json['used'] as int,
      available: json['available'] as int,
    );

Map<String, dynamic> _$$SpaceUsageImplToJson(_$SpaceUsageImpl instance) =>
    <String, dynamic>{
      'used': instance.used,
      'available': instance.available,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$spaceUsageHash() => r'22e4f6ead6639b9372ededcd6e68bccd23bdbfd2';

/// See also [spaceUsage].
@ProviderFor(spaceUsage)
final spaceUsageProvider = AutoDisposeFutureProvider<SpaceUsage>.internal(
  spaceUsage,
  name: r'spaceUsageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$spaceUsageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpaceUsageRef = AutoDisposeFutureProviderRef<SpaceUsage>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
