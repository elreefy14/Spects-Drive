import 'package:freezed_annotation/freezed_annotation.dart';

part '../.generated/auth/user.freezed.dart';
part '../.generated/auth/user.g.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    required String email,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'has_password') required bool hasPassword,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    String? language,
    String? country,
    String? timezone,
    String? image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
