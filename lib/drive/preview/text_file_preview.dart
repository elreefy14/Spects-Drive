import 'dart:io';

import 'package:bedrive/drive/drive_api_provider.dart';
import 'package:bedrive/drive/preview/generic_file_preview.dart';
import 'package:bedrive/drive/preview/locally_stored_file_view.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextFilePreview extends StatelessWidget {
  final FileEntry fileEntry;

  const TextFilePreview(this.fileEntry, {super.key});

  @override
  build(BuildContext context) {
    return LocallyStoredFileView(
      fileEntry: fileEntry,
      download: false,
      loading: (_) => const Center(child: CircularProgressIndicator()),
      childOrError: (file) => _TextView(
        fileEntry: fileEntry,
        locallyStoredFile: file,
      ),
    );
  }
}

class _TextView extends StatefulHookConsumerWidget {
  final FileEntry fileEntry;
  final File? locallyStoredFile;

  const _TextView({
    required this.fileEntry,
    required this.locallyStoredFile,
  });

  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends ConsumerState<_TextView> {
  bool loading = true;
  String textContent = '';
  bool error = false;

  @override
  initState() {
    super.initState();
    _fetchTextContent();
  }

  _fetchTextContent() async {
    final driveApi = ref.read(driveApiProvider).requireValue;
    final localFile = widget.locallyStoredFile;
    if (localFile != null) {
      textContent = await localFile.readAsString();
    } else {
      try {
        textContent = await driveApi.fetchFileContent(widget.fileEntry);
      } on ApiClientException {
        error = true;
      }
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error) {
      return GenericFilePreview(widget.fileEntry);
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Text(textContent),
      ),
    );
  }
}
