// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../../../drive/layout/drive_drawer/settings_screen/notification_section/notification_subscriptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationSubscriptions _$NotificationSubscriptionsFromJson(
    Map<String, dynamic> json) {
  return _NotificationSubscriptions.fromJson(json);
}

/// @nodoc
mixin _$NotificationSubscriptions {
  List<SubscriptionGroup> get subscriptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'user_selections')
  List<UserSelection> get selections => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSubscriptionsCopyWith<NotificationSubscriptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSubscriptionsCopyWith<$Res> {
  factory $NotificationSubscriptionsCopyWith(NotificationSubscriptions value,
          $Res Function(NotificationSubscriptions) then) =
      _$NotificationSubscriptionsCopyWithImpl<$Res, NotificationSubscriptions>;
  @useResult
  $Res call(
      {List<SubscriptionGroup> subscriptions,
      @JsonKey(name: 'user_selections') List<UserSelection> selections});
}

/// @nodoc
class _$NotificationSubscriptionsCopyWithImpl<$Res,
        $Val extends NotificationSubscriptions>
    implements $NotificationSubscriptionsCopyWith<$Res> {
  _$NotificationSubscriptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptions = null,
    Object? selections = null,
  }) {
    return _then(_value.copyWith(
      subscriptions: null == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionGroup>,
      selections: null == selections
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<UserSelection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSubscriptionsImplCopyWith<$Res>
    implements $NotificationSubscriptionsCopyWith<$Res> {
  factory _$$NotificationSubscriptionsImplCopyWith(
          _$NotificationSubscriptionsImpl value,
          $Res Function(_$NotificationSubscriptionsImpl) then) =
      __$$NotificationSubscriptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SubscriptionGroup> subscriptions,
      @JsonKey(name: 'user_selections') List<UserSelection> selections});
}

/// @nodoc
class __$$NotificationSubscriptionsImplCopyWithImpl<$Res>
    extends _$NotificationSubscriptionsCopyWithImpl<$Res,
        _$NotificationSubscriptionsImpl>
    implements _$$NotificationSubscriptionsImplCopyWith<$Res> {
  __$$NotificationSubscriptionsImplCopyWithImpl(
      _$NotificationSubscriptionsImpl _value,
      $Res Function(_$NotificationSubscriptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptions = null,
    Object? selections = null,
  }) {
    return _then(_$NotificationSubscriptionsImpl(
      subscriptions: null == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionGroup>,
      selections: null == selections
          ? _value._selections
          : selections // ignore: cast_nullable_to_non_nullable
              as List<UserSelection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSubscriptionsImpl implements _NotificationSubscriptions {
  const _$NotificationSubscriptionsImpl(
      {required final List<SubscriptionGroup> subscriptions,
      @JsonKey(name: 'user_selections')
      required final List<UserSelection> selections})
      : _subscriptions = subscriptions,
        _selections = selections;

  factory _$NotificationSubscriptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSubscriptionsImplFromJson(json);

  final List<SubscriptionGroup> _subscriptions;
  @override
  List<SubscriptionGroup> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  final List<UserSelection> _selections;
  @override
  @JsonKey(name: 'user_selections')
  List<UserSelection> get selections {
    if (_selections is EqualUnmodifiableListView) return _selections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selections);
  }

  @override
  String toString() {
    return 'NotificationSubscriptions(subscriptions: $subscriptions, selections: $selections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSubscriptionsImpl &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions) &&
            const DeepCollectionEquality()
                .equals(other._selections, _selections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subscriptions),
      const DeepCollectionEquality().hash(_selections));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSubscriptionsImplCopyWith<_$NotificationSubscriptionsImpl>
      get copyWith => __$$NotificationSubscriptionsImplCopyWithImpl<
          _$NotificationSubscriptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSubscriptionsImplToJson(
      this,
    );
  }
}

abstract class _NotificationSubscriptions implements NotificationSubscriptions {
  const factory _NotificationSubscriptions(
          {required final List<SubscriptionGroup> subscriptions,
          @JsonKey(name: 'user_selections')
          required final List<UserSelection> selections}) =
      _$NotificationSubscriptionsImpl;

  factory _NotificationSubscriptions.fromJson(Map<String, dynamic> json) =
      _$NotificationSubscriptionsImpl.fromJson;

  @override
  List<SubscriptionGroup> get subscriptions;
  @override
  @JsonKey(name: 'user_selections')
  List<UserSelection> get selections;
  @override
  @JsonKey(ignore: true)
  _$$NotificationSubscriptionsImplCopyWith<_$NotificationSubscriptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SubscriptionGroup _$SubscriptionGroupFromJson(Map<String, dynamic> json) {
  return _SubscriptionGroup.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionGroup {
  @JsonKey(name: 'group_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscriptions')
  List<SubscriptionGroupItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionGroupCopyWith<SubscriptionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionGroupCopyWith<$Res> {
  factory $SubscriptionGroupCopyWith(
          SubscriptionGroup value, $Res Function(SubscriptionGroup) then) =
      _$SubscriptionGroupCopyWithImpl<$Res, SubscriptionGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'group_name') String name,
      @JsonKey(name: 'subscriptions') List<SubscriptionGroupItem> items});
}

/// @nodoc
class _$SubscriptionGroupCopyWithImpl<$Res, $Val extends SubscriptionGroup>
    implements $SubscriptionGroupCopyWith<$Res> {
  _$SubscriptionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionGroupItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionGroupImplCopyWith<$Res>
    implements $SubscriptionGroupCopyWith<$Res> {
  factory _$$SubscriptionGroupImplCopyWith(_$SubscriptionGroupImpl value,
          $Res Function(_$SubscriptionGroupImpl) then) =
      __$$SubscriptionGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'group_name') String name,
      @JsonKey(name: 'subscriptions') List<SubscriptionGroupItem> items});
}

/// @nodoc
class __$$SubscriptionGroupImplCopyWithImpl<$Res>
    extends _$SubscriptionGroupCopyWithImpl<$Res, _$SubscriptionGroupImpl>
    implements _$$SubscriptionGroupImplCopyWith<$Res> {
  __$$SubscriptionGroupImplCopyWithImpl(_$SubscriptionGroupImpl _value,
      $Res Function(_$SubscriptionGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? items = null,
  }) {
    return _then(_$SubscriptionGroupImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionGroupItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionGroupImpl implements _SubscriptionGroup {
  const _$SubscriptionGroupImpl(
      {@JsonKey(name: 'group_name') required this.name,
      @JsonKey(name: 'subscriptions')
      required final List<SubscriptionGroupItem> items})
      : _items = items;

  factory _$SubscriptionGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionGroupImplFromJson(json);

  @override
  @JsonKey(name: 'group_name')
  final String name;
  final List<SubscriptionGroupItem> _items;
  @override
  @JsonKey(name: 'subscriptions')
  List<SubscriptionGroupItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SubscriptionGroup(name: $name, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionGroupImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionGroupImplCopyWith<_$SubscriptionGroupImpl> get copyWith =>
      __$$SubscriptionGroupImplCopyWithImpl<_$SubscriptionGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionGroupImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionGroup implements SubscriptionGroup {
  const factory _SubscriptionGroup(
          {@JsonKey(name: 'group_name') required final String name,
          @JsonKey(name: 'subscriptions')
          required final List<SubscriptionGroupItem> items}) =
      _$SubscriptionGroupImpl;

  factory _SubscriptionGroup.fromJson(Map<String, dynamic> json) =
      _$SubscriptionGroupImpl.fromJson;

  @override
  @JsonKey(name: 'group_name')
  String get name;
  @override
  @JsonKey(name: 'subscriptions')
  List<SubscriptionGroupItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionGroupImplCopyWith<_$SubscriptionGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionGroupItem _$SubscriptionGroupItemFromJson(
    Map<String, dynamic> json) {
  return _SubscriptionGroupItem.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionGroupItem {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'notif_id')
  String get notifId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionGroupItemCopyWith<SubscriptionGroupItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionGroupItemCopyWith<$Res> {
  factory $SubscriptionGroupItemCopyWith(SubscriptionGroupItem value,
          $Res Function(SubscriptionGroupItem) then) =
      _$SubscriptionGroupItemCopyWithImpl<$Res, SubscriptionGroupItem>;
  @useResult
  $Res call({String name, @JsonKey(name: 'notif_id') String notifId});
}

/// @nodoc
class _$SubscriptionGroupItemCopyWithImpl<$Res,
        $Val extends SubscriptionGroupItem>
    implements $SubscriptionGroupItemCopyWith<$Res> {
  _$SubscriptionGroupItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? notifId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notifId: null == notifId
          ? _value.notifId
          : notifId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionGroupItemImplCopyWith<$Res>
    implements $SubscriptionGroupItemCopyWith<$Res> {
  factory _$$SubscriptionGroupItemImplCopyWith(
          _$SubscriptionGroupItemImpl value,
          $Res Function(_$SubscriptionGroupItemImpl) then) =
      __$$SubscriptionGroupItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, @JsonKey(name: 'notif_id') String notifId});
}

/// @nodoc
class __$$SubscriptionGroupItemImplCopyWithImpl<$Res>
    extends _$SubscriptionGroupItemCopyWithImpl<$Res,
        _$SubscriptionGroupItemImpl>
    implements _$$SubscriptionGroupItemImplCopyWith<$Res> {
  __$$SubscriptionGroupItemImplCopyWithImpl(_$SubscriptionGroupItemImpl _value,
      $Res Function(_$SubscriptionGroupItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? notifId = null,
  }) {
    return _then(_$SubscriptionGroupItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      notifId: null == notifId
          ? _value.notifId
          : notifId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionGroupItemImpl implements _SubscriptionGroupItem {
  const _$SubscriptionGroupItemImpl(
      {required this.name, @JsonKey(name: 'notif_id') required this.notifId});

  factory _$SubscriptionGroupItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionGroupItemImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'notif_id')
  final String notifId;

  @override
  String toString() {
    return 'SubscriptionGroupItem(name: $name, notifId: $notifId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionGroupItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.notifId, notifId) || other.notifId == notifId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, notifId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionGroupItemImplCopyWith<_$SubscriptionGroupItemImpl>
      get copyWith => __$$SubscriptionGroupItemImplCopyWithImpl<
          _$SubscriptionGroupItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionGroupItemImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionGroupItem implements SubscriptionGroupItem {
  const factory _SubscriptionGroupItem(
          {required final String name,
          @JsonKey(name: 'notif_id') required final String notifId}) =
      _$SubscriptionGroupItemImpl;

  factory _SubscriptionGroupItem.fromJson(Map<String, dynamic> json) =
      _$SubscriptionGroupItemImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'notif_id')
  String get notifId;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionGroupItemImplCopyWith<_$SubscriptionGroupItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserSelection _$UserSelectionFromJson(Map<String, dynamic> json) {
  return _UserSelection.fromJson(json);
}

/// @nodoc
mixin _$UserSelection {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'notif_id')
  String get notifId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  Map<String, bool> get channels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSelectionCopyWith<UserSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSelectionCopyWith<$Res> {
  factory $UserSelectionCopyWith(
          UserSelection value, $Res Function(UserSelection) then) =
      _$UserSelectionCopyWithImpl<$Res, UserSelection>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'notif_id') String notifId,
      @JsonKey(name: 'user_id') int userId,
      Map<String, bool> channels});
}

/// @nodoc
class _$UserSelectionCopyWithImpl<$Res, $Val extends UserSelection>
    implements $UserSelectionCopyWith<$Res> {
  _$UserSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notifId = null,
    Object? userId = null,
    Object? channels = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifId: null == notifId
          ? _value.notifId
          : notifId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      channels: null == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSelectionImplCopyWith<$Res>
    implements $UserSelectionCopyWith<$Res> {
  factory _$$UserSelectionImplCopyWith(
          _$UserSelectionImpl value, $Res Function(_$UserSelectionImpl) then) =
      __$$UserSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'notif_id') String notifId,
      @JsonKey(name: 'user_id') int userId,
      Map<String, bool> channels});
}

/// @nodoc
class __$$UserSelectionImplCopyWithImpl<$Res>
    extends _$UserSelectionCopyWithImpl<$Res, _$UserSelectionImpl>
    implements _$$UserSelectionImplCopyWith<$Res> {
  __$$UserSelectionImplCopyWithImpl(
      _$UserSelectionImpl _value, $Res Function(_$UserSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? notifId = null,
    Object? userId = null,
    Object? channels = null,
  }) {
    return _then(_$UserSelectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      notifId: null == notifId
          ? _value.notifId
          : notifId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      channels: null == channels
          ? _value._channels
          : channels // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSelectionImpl implements _UserSelection {
  const _$UserSelectionImpl(
      {required this.id,
      @JsonKey(name: 'notif_id') required this.notifId,
      @JsonKey(name: 'user_id') required this.userId,
      required final Map<String, bool> channels})
      : _channels = channels;

  factory _$UserSelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSelectionImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'notif_id')
  final String notifId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  final Map<String, bool> _channels;
  @override
  Map<String, bool> get channels {
    if (_channels is EqualUnmodifiableMapView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_channels);
  }

  @override
  String toString() {
    return 'UserSelection(id: $id, notifId: $notifId, userId: $userId, channels: $channels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSelectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notifId, notifId) || other.notifId == notifId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._channels, _channels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, notifId, userId,
      const DeepCollectionEquality().hash(_channels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSelectionImplCopyWith<_$UserSelectionImpl> get copyWith =>
      __$$UserSelectionImplCopyWithImpl<_$UserSelectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSelectionImplToJson(
      this,
    );
  }
}

abstract class _UserSelection implements UserSelection {
  const factory _UserSelection(
      {required final String id,
      @JsonKey(name: 'notif_id') required final String notifId,
      @JsonKey(name: 'user_id') required final int userId,
      required final Map<String, bool> channels}) = _$UserSelectionImpl;

  factory _UserSelection.fromJson(Map<String, dynamic> json) =
      _$UserSelectionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'notif_id')
  String get notifId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  Map<String, bool> get channels;
  @override
  @JsonKey(ignore: true)
  _$$UserSelectionImplCopyWith<_$UserSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
