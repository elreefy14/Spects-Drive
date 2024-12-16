import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../.generated/drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions.freezed.dart';
part '../../../../../.generated/drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions.g.dart';

@freezed
class NotificationSubscriptions with _$NotificationSubscriptions {
  const factory NotificationSubscriptions({
    required List<SubscriptionGroup> subscriptions,
    @JsonKey(name: 'user_selections') required List<UserSelection> selections,
  }) = _NotificationSubscriptions;

  factory NotificationSubscriptions.fromJson(Map<String, dynamic> json) =>
      _$NotificationSubscriptionsFromJson(json);
}

@freezed
class SubscriptionGroup with _$SubscriptionGroup {
  const factory SubscriptionGroup({
    @JsonKey(name: 'group_name') required String name,
    @JsonKey(name: 'subscriptions') required List<SubscriptionGroupItem> items,
  }) = _SubscriptionGroup;

  factory SubscriptionGroup.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGroupFromJson(json);
}

@freezed
class SubscriptionGroupItem with _$SubscriptionGroupItem {
  const factory SubscriptionGroupItem({
    required String name,
    @JsonKey(name: 'notif_id') required String notifId,
  }) = _SubscriptionGroupItem;

  factory SubscriptionGroupItem.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionGroupItemFromJson(json);
}

@freezed
class UserSelection with _$UserSelection {
  const factory UserSelection({
    required String id,
    @JsonKey(name: 'notif_id') required String notifId,
    @JsonKey(name: 'user_id') required int userId,
    required Map<String, bool> channels,
  }) = _UserSelection;

  factory UserSelection.fromJson(Map<String, dynamic> json) =>
      _$UserSelectionFromJson(json);
}
