// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../auth/user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      hasPassword: json['has_password'] as bool,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      name: json['name'] as String,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      accessToken: json['access_token'] as String?,
      fcmToken: json['fcm_token'] as String?,
      language: json['language'] as String?,
      country: json['country'] as String?,
      timezone: json['timezone'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'has_password': instance.hasPassword,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'name': instance.name,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'access_token': instance.accessToken,
      'fcm_token': instance.fcmToken,
      'language': instance.language,
      'country': instance.country,
      'timezone': instance.timezone,
      'image': instance.image,
    };
