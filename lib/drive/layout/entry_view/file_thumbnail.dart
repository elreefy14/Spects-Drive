import 'dart:math';

import 'package:bedrive/drive/preview/locally_stored_file_view.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../http/api_client.dart';
import '../../../models/file_entry.dart';
import 'file_icon_colors.dart';

enum FileThumbnailSize {
  tiny,
  small,
  unbound,
}

class FileThumbnail extends StatelessWidget {
  final FileEntry fileEntry;
  final FileThumbnailSize size;
  final String type;
  final BorderRadius? borderRadius;

  static String _getType(FileEntry fileEntry) {
    String? mime = fileEntry.mime;
    String? type = fileEntry.type;
    return type ??= mime != null ? mime.split('/')[0] : 'generic';
  }

  FileThumbnail(
    this.fileEntry, {
    super.key,
    required this.size,
    this.borderRadius,
  }) : type = _getType(fileEntry);

  @override
  Widget build(BuildContext context) {
    if (type == 'image') {
      return ImageThumbnail(fileEntry, size: size, borderRadius: borderRadius);
    }
    return FileTypeIcon(type, size: size);
  }
}

class ImageThumbnail extends ConsumerWidget {
  final FileEntry fileEntry;
  final FileThumbnailSize size;
  final Image placeholder;
  final BoxFit fit;
  final Widget? error;
  final BorderRadius? borderRadius;

  static double _sizeToWidth(FileThumbnailSize size) {
    return switch (size) {
      FileThumbnailSize.tiny => 24,
      FileThumbnailSize.small => 30,
      _ => double.infinity,
    };
  }

  static Image _getPlaceholder({
    required double size,
    required BoxFit fit,
  }) {
    return Image.asset(
      'assets/images/default-image.jpg',
      fit: fit,
      width: min(size, 500),
    );
  }

  ImageThumbnail(
    this.fileEntry, {
    super.key,
    required this.size,
    this.fit = BoxFit.cover,
    this.error,
    this.borderRadius,
  }) : placeholder = _getPlaceholder(size: _sizeToWidth(size), fit: fit);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = _sizeToWidth(size);
    final api = ref.read(apiClientProvider).requireValue;
    String? imageUrl = fileEntry.url;
    String? mime = fileEntry.mime ?? '';
    if (imageUrl == null) {
      return placeholder;
    }

    Uri uri = api.buildUri(imageUrl);

    if (fileEntry.thumbnail) {
      uri = uri.replace(queryParameters: {'thumbnail': 'true'});
    }

    if (mime.contains('svg')) {
      return SvgPicture.network(
        uri.toString(),
        fit: fit,
        width: width,
        headers: api.authHeaders,
        placeholderBuilder: (_) => placeholder,
      );
    } else {
      return ClipRRect(
        borderRadius: borderRadius ??
            BorderRadius.circular(
              context.appTheme.panelRadius,
            ),
        child: CachedNetworkImage(
          imageUrl: uri.toString(),
          httpHeaders: api.authHeaders,
          fit: fit,
          width: width,
          height: width,
          errorWidget: (bc, url, err) {
            return LocallyStoredFileView(
              fileEntry: fileEntry,
              child: (file) => Image(
                image: FileImage(file),
                fit: fit,
                width: width,
                height: width,
              ),
              loading: (progress) => placeholder,
              error: placeholder,
            );
          },
        ),
      );
    }
  }
}

class FileTypeIcon extends StatelessWidget {
  final String? type;
  final FileThumbnailSize size;
  final double sizeInPixels;
  final String iconName;

  static double _getSizeInPixels(FileThumbnailSize? size) {
    return switch (size) {
      FileThumbnailSize.tiny => 17,
      FileThumbnailSize.small => 30,
      _ => 74
    };
  }

  static String _getIconName(String? type) {
    if (type == null) {
      return 'generic';
    }
    return type.replaceAllMapped(
        RegExp(r'[A-Z]'), (match) => '-${match.group(0)!.toLowerCase()}');
  }

  FileTypeIcon(this.type, {super.key, required this.size})
      : iconName = _getIconName(type),
        sizeInPixels = _getSizeInPixels(size);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName-file-custom.svg',
      width: sizeInPixels,
      height: sizeInPixels,
      colorFilter: ColorFilter.mode(
          fileIconColors[type] ?? genericFileIconColor, BlendMode.srcIn),
    );
  }
}
