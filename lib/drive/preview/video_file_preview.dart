import 'dart:io';

import 'package:bedrive/drive/preview/generic_file_preview.dart';
import 'package:bedrive/drive/preview/locally_stored_file_view.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoFilePreview extends StatelessWidget {
  final FileEntry fileEntry;

  const VideoFilePreview(this.fileEntry, {super.key});

  @override
  build(BuildContext context) {
    return LocallyStoredFileView(
      fileEntry: fileEntry,
      download: false,
      loading: (_) => const Center(child: CircularProgressIndicator()),
      childOrError: (file) => Center(
        child: _VideoPlayer(
          locallyStoredFile: file,
          fileEntry: fileEntry,
        ),
      ),
    );
  }
}

class _VideoPlayer extends ConsumerStatefulWidget {
  final FileEntry fileEntry;
  final File? locallyStoredFile;

  const _VideoPlayer({
    required this.fileEntry,
    required this.locallyStoredFile,
  });

  @override
  ConsumerState<_VideoPlayer> createState() {
    return _VideoPlayerState();
  }
}

class _VideoPlayerState extends ConsumerState<_VideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool loading = true;

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initPlayer() async {
    final localFile = widget.locallyStoredFile;
    final apiClient = ref.read(apiClientProvider).requireValue;

    try {
      // initialize video player controller with locally stored file or file entry url
      if (localFile != null) {
        _videoPlayerController = VideoPlayerController.file(localFile);
      } else {
        _videoPlayerController = VideoPlayerController.networkUrl(
          apiClient.buildUri(widget.fileEntry.url!),
          httpHeaders: apiClient.authHeaders,
        );
      }
      await _videoPlayerController.initialize();

      // initialize chewie controller
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        allowPlaybackSpeedChanging: false,
        // don't auto-hide controls for audio files
        hideControlsTimer: widget.fileEntry.type == 'audio'
            ? const Duration()
            : ChewieController.defaultHideControlsTimer,
      );
    } catch (e) {
      //
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const CircularProgressIndicator();
    } else if (_chewieController == null) {
      return GenericFilePreview(widget.fileEntry);
    } else if (widget.fileEntry.type == 'audio') {
      return Container(
        height: 200,
        padding: const EdgeInsets.all(10),
        child: Chewie(controller: _chewieController!),
      );
    } else {
      return AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: Chewie(controller: _chewieController!),
      );
    }
  }
}
