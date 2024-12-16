import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../http/api_client.dart';
import 'transfers_manager.dart';
import 'transfers_manager_contract.dart';

part '../../../.generated/drive/transfers/manager/transfers_manager_provider.g.dart';

@riverpod
TransfersManagerContract transfersManager(TransfersManagerRef ref) {
  final apiClient = ref.watch(apiClientProvider).requireValue;
  return TransfersManager(apiClient);
}
