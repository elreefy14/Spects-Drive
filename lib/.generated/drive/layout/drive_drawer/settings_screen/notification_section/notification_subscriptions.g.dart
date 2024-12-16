// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSubscriptionsImpl _$$NotificationSubscriptionsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSubscriptionsImpl(
      subscriptions: (json['subscriptions'] as List<dynamic>)
          .map((e) => SubscriptionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      selections: (json['user_selections'] as List<dynamic>)
          .map((e) => UserSelection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NotificationSubscriptionsImplToJson(
        _$NotificationSubscriptionsImpl instance) =>
    <String, dynamic>{
      'subscriptions': instance.subscriptions,
      'user_selections': instance.selections,
    };

_$SubscriptionGroupImpl _$$SubscriptionGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionGroupImpl(
      name: json['group_name'] as String,
      items: (json['subscriptions'] as List<dynamic>)
          .map((e) => SubscriptionGroupItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubscriptionGroupImplToJson(
        _$SubscriptionGroupImpl instance) =>
    <String, dynamic>{
      'group_name': instance.name,
      'subscriptions': instance.items,
    };

_$SubscriptionGroupItemImpl _$$SubscriptionGroupItemImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionGroupItemImpl(
      name: json['name'] as String,
      notifId: json['notif_id'] as String,
    );

Map<String, dynamic> _$$SubscriptionGroupItemImplToJson(
        _$SubscriptionGroupItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'notif_id': instance.notifId,
    };

_$UserSelectionImpl _$$UserSelectionImplFromJson(Map<String, dynamic> json) =>
    _$UserSelectionImpl(
      id: json['id'] as String,
      notifId: json['notif_id'] as String,
      userId: json['user_id'] as int,
      channels: Map<String, bool>.from(json['channels'] as Map),
    );

Map<String, dynamic> _$$UserSelectionImplToJson(_$UserSelectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notif_id': instance.notifId,
      'user_id': instance.userId,
      'channels': instance.channels,
    };
