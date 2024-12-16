// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../../drive/transfers/manager/transfers_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferManagerMetadata _$TransferManagerMetadataFromJson(
    Map<String, dynamic> json) {
  return _TransferManagerMetadata.fromJson(json);
}

/// @nodoc
mixin _$TransferManagerMetadata {
  TransferType get transferType => throw _privateConstructorUsedError;
  int get fileSize => throw _privateConstructorUsedError;
  String? get mime => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferManagerMetadataCopyWith<TransferManagerMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferManagerMetadataCopyWith<$Res> {
  factory $TransferManagerMetadataCopyWith(TransferManagerMetadata value,
          $Res Function(TransferManagerMetadata) then) =
      _$TransferManagerMetadataCopyWithImpl<$Res, TransferManagerMetadata>;
  @useResult
  $Res call(
      {TransferType transferType, int fileSize, String? mime, String? type});
}

/// @nodoc
class _$TransferManagerMetadataCopyWithImpl<$Res,
        $Val extends TransferManagerMetadata>
    implements $TransferManagerMetadataCopyWith<$Res> {
  _$TransferManagerMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferType = null,
    Object? fileSize = null,
    Object? mime = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferManagerMetadataImplCopyWith<$Res>
    implements $TransferManagerMetadataCopyWith<$Res> {
  factory _$$TransferManagerMetadataImplCopyWith(
          _$TransferManagerMetadataImpl value,
          $Res Function(_$TransferManagerMetadataImpl) then) =
      __$$TransferManagerMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransferType transferType, int fileSize, String? mime, String? type});
}

/// @nodoc
class __$$TransferManagerMetadataImplCopyWithImpl<$Res>
    extends _$TransferManagerMetadataCopyWithImpl<$Res,
        _$TransferManagerMetadataImpl>
    implements _$$TransferManagerMetadataImplCopyWith<$Res> {
  __$$TransferManagerMetadataImplCopyWithImpl(
      _$TransferManagerMetadataImpl _value,
      $Res Function(_$TransferManagerMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transferType = null,
    Object? fileSize = null,
    Object? mime = freezed,
    Object? type = freezed,
  }) {
    return _then(_$TransferManagerMetadataImpl(
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as TransferType,
      fileSize: null == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int,
      mime: freezed == mime
          ? _value.mime
          : mime // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferManagerMetadataImpl extends _TransferManagerMetadata {
  _$TransferManagerMetadataImpl(
      {required this.transferType,
      required this.fileSize,
      this.mime,
      this.type})
      : super._();

  factory _$TransferManagerMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferManagerMetadataImplFromJson(json);

  @override
  final TransferType transferType;
  @override
  final int fileSize;
  @override
  final String? mime;
  @override
  final String? type;

  @override
  String toString() {
    return 'TransferManagerMetadata(transferType: $transferType, fileSize: $fileSize, mime: $mime, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferManagerMetadataImpl &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transferType, fileSize, mime, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferManagerMetadataImplCopyWith<_$TransferManagerMetadataImpl>
      get copyWith => __$$TransferManagerMetadataImplCopyWithImpl<
          _$TransferManagerMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferManagerMetadataImplToJson(
      this,
    );
  }
}

abstract class _TransferManagerMetadata extends TransferManagerMetadata {
  factory _TransferManagerMetadata(
      {required final TransferType transferType,
      required final int fileSize,
      final String? mime,
      final String? type}) = _$TransferManagerMetadataImpl;
  _TransferManagerMetadata._() : super._();

  factory _TransferManagerMetadata.fromJson(Map<String, dynamic> json) =
      _$TransferManagerMetadataImpl.fromJson;

  @override
  TransferType get transferType;
  @override
  int get fileSize;
  @override
  String? get mime;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$TransferManagerMetadataImplCopyWith<_$TransferManagerMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
