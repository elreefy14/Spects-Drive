import 'package:bedrive/models/file_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../.generated/drive/sharing/shareable_link_screen/shareable_link.freezed.dart';

part '../../../.generated/drive/sharing/shareable_link_screen/shareable_link.g.dart';

bool toBool(dynamic value) {
  if (value == 1 || value == true || value == 'true') {
    return true;
  }
  return false;
}

Object? thumbnailMapper(json, field) => toBool(json['thumbnail']);

Object? isStarredMapper(json, field) {
  if (json['tags'] == null) {
    return false;
  }
  return (json['tags'] as List).firstWhere(
        (tag) => tag['name'] == 'starred',
        orElse: () => null,
      ) !=
      null;
}

@freezed
class ShareableLink with _$ShareableLink {
  factory ShareableLink({
    required int id,
    required String hash,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'entry_id') required int entryId,
    @JsonKey(name: 'allow_edit') required bool allowEdit,
    @JsonKey(name: 'allow_download') required bool allowDownload,
    required String? password,
    required FileEntry entry,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ShareableLink;

  factory ShareableLink.fromJson(Map<String, dynamic> json) =>
      _$ShareableLinkFromJson(json);
}
