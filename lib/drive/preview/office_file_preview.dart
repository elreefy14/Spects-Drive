import 'package:bedrive/auth/access_token_store.dart';
import 'package:bedrive/http/api_client.dart';
import 'package:bedrive/models/file_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OfficeFilePreview extends ConsumerWidget {
  final FileEntry fileEntry;

  const OfficeFilePreview(this.fileEntry, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiClient = ref.watch(apiClientProvider).requireValue;
    Uri fileUrl = apiClient.buildUri(fileEntry.url!);
    fileUrl = fileUrl.replace(queryParameters: {
      ...fileUrl.queryParameters,
      'accessToken': AccessTokenStore.instance.get()!,
    });

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
            'https://view.officeapps.live.ai/op/embed.aspx?src=${Uri.encodeComponent(fileUrl.toString())}'),
      );

    return Container(
      transform: Matrix4.translationValues(-1, -1.1, 0),
      child: Center(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
