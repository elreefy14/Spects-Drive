import 'package:bedrive/models/file_entry.dart';
import 'package:bedrive/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchButton extends StatelessWidget {
  final FileEntry? folder;

  const SearchButton({this.folder, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search_rounded),
      onPressed: () {
        context.pushNamed(AppRoute.search.name, extra: folder);
      },
    );
  }
}
