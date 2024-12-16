import 'package:bedrive/bootstrap/local_config_provider.dart';
import 'package:bedrive/drive/sharing/shareable_link_screen/shareable_link_provider.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/localization_provider.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class ShareableLinkScreenFooter extends StatelessWidget {
  final int entryId;

  const ShareableLinkScreenFooter(this.entryId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: SizedBox(
        height: 52,
        child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CopyToClipboardButton(entryId),
                    ShareButton(entryId),
                    DeleteButton(entryId),
                  ],
                ),
                _SubmitButton(entryId),
              ],
            )),
      ),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  final int entryId;

  const _SubmitButton(this.entryId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(
      shareableLinkControllerProvider(entryId).notifier,
    );
    final state = ref.watch(shareableLinkControllerProvider(entryId));
    final isSaving = state.valueOrNull?.isSaving ?? false;
    final link = state.valueOrNull?.shareableLink;

    String text = link != null ? 'Update' : 'Create';
    if (isSaving) {
      text = 'Saving...';
    }

    submit() async {
      try {
        await controller.saveToBackend();
        context.showTextSnackBar(
          'Link ${link == null ? 'created' : 'updated'}',
        );
      } on ApiClientException catch (e) {
        context.showErrorSnackBar(e.message);
      }
    }

    return SizedBox(
      width: 100,
      child: FilledButton(
        onPressed: state.isLoading || isSaving ? null : () => submit(),
        child: StyledText(text),
      ),
    );
  }
}

class CopyToClipboardButton extends ConsumerWidget {
  final int entryId;

  const CopyToClipboardButton(this.entryId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final link = ref
        .watch(shareableLinkControllerProvider(entryId))
        .valueOrNull
        ?.shareableLink;

    copyToClipboard() {
      final backendUrl = ref.read(localConfigProvider).requireValue.backendUrl;
      final linkUrl = '$backendUrl/drive/s/${link!.hash}';
      Clipboard.setData(ClipboardData(text: linkUrl));
      context.showTextSnackBar(localizer.translate('Copied link to clipboard'));
    }

    return IconButton(
      icon: const Icon(Icons.copy_outlined),
      tooltip: localizer.translate('Copy to clipboard'),
      onPressed: link == null ? null : () => copyToClipboard(),
    );
  }
}

class ShareButton extends ConsumerWidget {
  final int entryId;

  const ShareButton(this.entryId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final link = ref
        .watch(shareableLinkControllerProvider(entryId))
        .valueOrNull
        ?.shareableLink;
    final entry = ref
        .watch(shareableLinkControllerProvider(entryId))
        .valueOrNull
        ?.shareableLink
        ?.entry;

    share() {
      final backendUrl = ref.read(localConfigProvider).requireValue.backendUrl;
      final linkUrl = '$backendUrl/drive/s/${link!.hash}';
      Share.share(
        linkUrl,
        subject: localizer.translate('Share :link', {'link': entry!.name}),
      );
    }

    return IconButton(
      icon: const Icon(Icons.share_outlined),
      tooltip: localizer.translate('Share'),
      onPressed: link == null ? null : () => share(),
    );
  }
}

class DeleteButton extends ConsumerWidget {
  final int entryId;

  const DeleteButton(this.entryId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizer = ref.watch(localizationProvider);
    final link = ref
        .watch(shareableLinkControllerProvider(entryId))
        .valueOrNull
        ?.shareableLink;

    delete() {
      try {
        ref
            .read(shareableLinkControllerProvider(entryId).notifier)
            .deleteShareableLink();
        context.showTextSnackBar(localizer.translate('Deleted link.'));
        context.pop();
      } on ApiClientException catch (e) {
        context.showErrorSnackBar(e.message);
      }
    }

    return IconButton(
      icon: const Icon(Icons.delete_outline_outlined),
      tooltip: localizer.translate('Delete'),
      onPressed: link == null ? null : () => delete(),
    );
  }
}
