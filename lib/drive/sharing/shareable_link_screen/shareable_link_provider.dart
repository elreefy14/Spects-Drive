import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/drive/sharing/shareable_link_screen/shareable_link.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../.generated/drive/sharing/shareable_link_screen/shareable_link_provider.freezed.dart';
part '../../../.generated/drive/sharing/shareable_link_screen/shareable_link_provider.g.dart';

@riverpod
class ShareableLinkController extends _$ShareableLinkController {
  Future<void> saveToBackend() async {
    final driveApi = ref.watch(driveApiProvider).requireValue;
    final state = this.state.requireValue;
    final payload = {
      'allowEdit': state.canEdit,
      'allowDownload': state.canDownload,
      'password': state.currentPassword,
      'expiresAt': state.currentExpiration?.toIso8601String(),
    };

    this.state = AsyncData(
      this.state.requireValue.copyWith(isSaving: true),
    );

    try {
      if (state.shareableLink != null) {
        await driveApi.updateShareableLink(entryId, payload);
      } else {
        await driveApi.createShareableLink(entryId, payload);
      }
    } finally {
      this.state = AsyncData(
        this.state.requireValue.copyWith(isSaving: false),
      );
    }

    ref.invalidateSelf();
  }

  Future<void> deleteShareableLink() async {
    final driveApi = await ref.watch(driveApiProvider.future);
    state = const AsyncLoading();
    await driveApi.deleteShareableLink(entryId);
    ref.invalidateSelf();
  }

  setHasExpiration(bool hasExpiration) {
    state = AsyncData(
      state.requireValue.copyWith(hasExpiration: hasExpiration),
    );
  }

  setCurrentExpiration(DateTime? expiration) {
    state = AsyncData(
      state.requireValue.copyWith(currentExpiration: expiration),
    );
  }

  setHasPassword(bool hasPassword) {
    state = AsyncData(
      state.requireValue.copyWith(hasPassword: hasPassword),
    );
  }

  setCurrentPassword(String? password) {
    state = AsyncData(
      state.requireValue.copyWith(currentPassword: password),
    );
  }

  setCanEdit(bool canEdit) {
    state = AsyncData(
      state.requireValue.copyWith(canEdit: canEdit),
    );
  }

  setCanDownload(bool canDownload) {
    state = AsyncData(
      state.requireValue.copyWith(canDownload: canDownload),
    );
  }

  @override
  Future<ShareableLinkState> build(int entryId) async {
    ref.cacheResults();
    final driveApi = await ref.watch(driveApiProvider.future);
    final link = await driveApi.fetchShareableLink(entryId);
    return ShareableLinkState(
      shareableLink: link,
      isSaving: false,
      hasPassword: link?.password?.isNotEmpty ?? false,
      currentPassword: link?.password,
      currentExpiration: link?.expiresAt,
      hasExpiration: link?.expiresAt != null,
      canEdit: link?.allowEdit ?? false,
      canDownload: link?.allowDownload ?? false,
    );
  }
}

@freezed
class ShareableLinkState with _$ShareableLinkState {
  factory ShareableLinkState({
    required ShareableLink? shareableLink,
    required bool isSaving,
    required bool hasPassword,
    required bool hasExpiration,
    required bool canEdit,
    required bool canDownload,
    String? currentPassword,
    DateTime? currentExpiration,
  }) = _ShareableLinkState;
}
