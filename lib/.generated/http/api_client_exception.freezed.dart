// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../http/api_client_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.ai/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiClientException {
  ApiClientExceptionType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  Map<String, String>? get validationErrors =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiClientExceptionCopyWith<ApiClientException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiClientExceptionCopyWith<$Res> {
  factory $ApiClientExceptionCopyWith(
          ApiClientException value, $Res Function(ApiClientException) then) =
      _$ApiClientExceptionCopyWithImpl<$Res, ApiClientException>;
  @useResult
  $Res call(
      {ApiClientExceptionType type,
      String message,
      int? statusCode,
      Map<String, String>? validationErrors});
}

/// @nodoc
class _$ApiClientExceptionCopyWithImpl<$Res, $Val extends ApiClientException>
    implements $ApiClientExceptionCopyWith<$Res> {
  _$ApiClientExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? statusCode = freezed,
    Object? validationErrors = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ApiClientExceptionType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      validationErrors: freezed == validationErrors
          ? _value.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiClientExceptionImplCopyWith<$Res>
    implements $ApiClientExceptionCopyWith<$Res> {
  factory _$$ApiClientExceptionImplCopyWith(_$ApiClientExceptionImpl value,
          $Res Function(_$ApiClientExceptionImpl) then) =
      __$$ApiClientExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiClientExceptionType type,
      String message,
      int? statusCode,
      Map<String, String>? validationErrors});
}

/// @nodoc
class __$$ApiClientExceptionImplCopyWithImpl<$Res>
    extends _$ApiClientExceptionCopyWithImpl<$Res, _$ApiClientExceptionImpl>
    implements _$$ApiClientExceptionImplCopyWith<$Res> {
  __$$ApiClientExceptionImplCopyWithImpl(_$ApiClientExceptionImpl _value,
      $Res Function(_$ApiClientExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = null,
    Object? statusCode = freezed,
    Object? validationErrors = freezed,
  }) {
    return _then(_$ApiClientExceptionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ApiClientExceptionType,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      validationErrors: freezed == validationErrors
          ? _value._validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$ApiClientExceptionImpl implements _ApiClientException {
  _$ApiClientExceptionImpl(
      {required this.type,
      required this.message,
      this.statusCode,
      final Map<String, String>? validationErrors})
      : _validationErrors = validationErrors;

  @override
  final ApiClientExceptionType type;
  @override
  final String message;
  @override
  final int? statusCode;
  final Map<String, String>? _validationErrors;
  @override
  Map<String, String>? get validationErrors {
    final value = _validationErrors;
    if (value == null) return null;
    if (_validationErrors is EqualUnmodifiableMapView) return _validationErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiClientException(type: $type, message: $message, statusCode: $statusCode, validationErrors: $validationErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiClientExceptionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality()
                .equals(other._validationErrors, _validationErrors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, message, statusCode,
      const DeepCollectionEquality().hash(_validationErrors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiClientExceptionImplCopyWith<_$ApiClientExceptionImpl> get copyWith =>
      __$$ApiClientExceptionImplCopyWithImpl<_$ApiClientExceptionImpl>(
          this, _$identity);
}

abstract class _ApiClientException implements ApiClientException {
  factory _ApiClientException(
      {required final ApiClientExceptionType type,
      required final String message,
      final int? statusCode,
      final Map<String, String>? validationErrors}) = _$ApiClientExceptionImpl;

  @override
  ApiClientExceptionType get type;
  @override
  String get message;
  @override
  int? get statusCode;
  @override
  Map<String, String>? get validationErrors;
  @override
  @JsonKey(ignore: true)
  _$$ApiClientExceptionImplCopyWith<_$ApiClientExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
