import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:bedrive/utils/format_file_size.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../.generated/drive/layout/drive_drawer/space_usage_provider.freezed.dart';
part '../../../.generated/drive/layout/drive_drawer/space_usage_provider.g.dart';

@riverpod
Future<SpaceUsage> spaceUsage(SpaceUsageRef ref) async {
  ref.cacheResults();
  final apiClient = ref.watch(apiClientProvider).requireValue;
  final response = await apiClient.get(
    'user/space-usage',
    options: ApiClientOptions(cacheResponse: true),
  );
  return SpaceUsage.fromJson(response);
}

@freezed
class SpaceUsage with _$SpaceUsage {
  const SpaceUsage._();

  const factory SpaceUsage({
    required int used,
    required int available,
  }) = _SpaceUsage;

  get usedPercentage => used / (used + available) * 100;

  get humanReadableUsed => formatFileSize(used);

  get humanReadableAvailable => formatFileSize(available);

  factory SpaceUsage.fromJson(Map<String, dynamic> json) =>
      _$SpaceUsageFromJson(json);
}
