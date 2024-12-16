import 'package:bedrive/drive/transfers/models/transfer_queue_item.dart';
import 'package:bedrive/models/file_entry.dart';

class DownloadTransferTask {
  final String? id;
  final String? path;
  final TransferType type;
  final BaseFileEntry entry;

  DownloadTransferTask({
    this.id,
    this.path,
    required this.type,
    required this.entry,
  });
}
