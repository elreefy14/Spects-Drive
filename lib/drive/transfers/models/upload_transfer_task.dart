class UploadTransferTask {
  final String? taskId;
  final String path;
  final int fileSize;

  UploadTransferTask({
    this.taskId,
    required this.path,
    required this.fileSize,
  });
}
