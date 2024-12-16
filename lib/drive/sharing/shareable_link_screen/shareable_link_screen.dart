import 'package:bedrive/drive/illustrated_message.dart';
import 'package:bedrive/drive/sharing/shareable_link_screen/shareable_link_provider.dart';
import 'package:bedrive/drive/sharing/shareable_link_screen/shareable_link_screen_footer.dart';
import 'package:bedrive/http/api_client_exception.dart';
import 'package:bedrive/i18n/styled_text.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../i18n/localization_provider.dart';

class ShareableLinkScreen extends HookConsumerWidget {
  final shareableLinkFormKey = GlobalKey<FormState>();
  final FileEntry fileEntry;

  ShareableLinkScreen(this.fileEntry, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(shareableLinkControllerProvider(fileEntry.id));
    final content = switch (asyncValue) {
      AsyncData() => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: shareableLinkFormKey,
            child: Column(
              children: [
                ExpirationDateField(entryId: fileEntry.id),
                const SizedBox(height: 25),
                const Divider(thickness: 1),
                PasswordFormField(entryId: fileEntry.id),
                const SizedBox(height: 25),
                const Divider(thickness: 1),
                AllowEditingField(entryId: fileEntry.id),
                const SizedBox(height: 25),
                const Divider(thickness: 1),
                AllowDownloadFormField(entryId: fileEntry.id),
              ],
            ),
          ),
        ),
      ),
      AsyncError(:final error) => Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: IllustratedMessage(
            title: 'Something went wrong',
            message: error is ApiClientException
                ? error.message
                : 'Failed to load shareable link',
            assetPath: 'assets/icons/bug-fixing.svg',
            onTryAgain: () => ref.refresh(
              shareableLinkControllerProvider(fileEntry.id),
            ),
          ),
        ),
      ),
      _ => const Center(child: CircularProgressIndicator()),
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledText(fileEntry.name, translate: false),
            const StyledText('Shareable link', size: 14),
          ],
        ),
      ),
      body: content,
      bottomNavigationBar: ShareableLinkScreenFooter(fileEntry.id),
    );
  }
}

class ExpirationDateField extends HookConsumerWidget {
  final int entryId;

  const ExpirationDateField({
    required this.entryId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final state = ref.watch(shareableLinkControllerProvider(entryId)).requireValue;
    final controller = ref.watch(shareableLinkControllerProvider(entryId).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          title: StyledText(
            'Link expiration',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          value: state.hasExpiration,
          onChanged: (isChecked) {
            controller.setHasExpiration(isChecked ?? false);
            if (isChecked == true) {
              focusNode.requestFocus();
            }
          },
        ),
        if (state.hasExpiration)
          TextFormField(
            focusNode: focusNode,
            readOnly: true,
            controller: TextEditingController(
              text: state.currentExpiration != null
                  ? DateFormat('MMM dd, yyyy').format(state.currentExpiration!)
                  : '',
            ),
            decoration: const InputDecoration(
              labelText: 'Link is valid until',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: state.currentExpiration ??
                    DateTime.now().add(const Duration(days: 1)),
                firstDate: DateTime.now().add(const Duration(days: 1)),
                lastDate: DateTime.now().add(const Duration(days: 300)),
              );

              if (picked != null) {
                controller.setCurrentExpiration(picked);
              }
            },
          ),
      ],
    );
  }
}

class PasswordFormField extends HookConsumerWidget {
  final int entryId;

  const PasswordFormField({
    required this.entryId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final localizer = ref.watch(localizationProvider);
    final state = ref.watch(shareableLinkControllerProvider(entryId)).requireValue;
    final controller = ref.watch(shareableLinkControllerProvider(entryId).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          title: StyledText(
            'Require password',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          value: state.hasPassword,
          onChanged: (isChecked) {
            controller.setHasPassword(isChecked ?? false);
            if (isChecked == true) {
              focusNode.requestFocus();
            }
          },
        ),
        if (state.hasPassword)
          TextFormField(
            focusNode: focusNode,
            initialValue: state.currentPassword,
            onChanged: (v) => controller.setCurrentPassword(v),
            obscureText: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: localizer.translate('Enter new password...'),
            ),
          ),
      ],
    );
  }
}

class AllowEditingField extends ConsumerWidget {
  final int entryId;

  const AllowEditingField({
    required this.entryId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shareableLinkControllerProvider(entryId)).requireValue;
    final controller = ref.watch(shareableLinkControllerProvider(entryId).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          title: StyledText(
            'Allow editing',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          value: state.canEdit,
          onChanged: (value) => controller.setCanEdit(value ?? false),
        ),
        const StyledText('Users with link can download this item')
      ],
    );
  }
}

class AllowDownloadFormField extends ConsumerWidget {
  final int entryId;

  const AllowDownloadFormField({
    required this.entryId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shareableLinkControllerProvider(entryId)).requireValue;
    final controller = ref.watch(shareableLinkControllerProvider(entryId).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          title: StyledText(
            'Allow download',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          value: state.canDownload,
          onChanged: (value) => controller.setCanDownload(value ?? false),
        ),
        const StyledText(
          'Users with link can import this item into their own drive',
        ),
      ],
    );
  }
}